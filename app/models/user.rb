class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sushis, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_sushis, through: :likes, source: :sushi

  def already_liked?(sushi)
    self.likes.exists?(sushi_id: sushi.id)
  end

  validates :name, presence: true
  validates :profile, length: { maximum: 200 } 

  mount_uploader :image, ImageUploader

end
