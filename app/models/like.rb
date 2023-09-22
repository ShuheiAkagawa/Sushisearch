class Like < ApplicationRecord
  belongs_to :sushi
  belongs_to :user

  validates_uniqueness_of :sushi_id, scope: :user_id

end
