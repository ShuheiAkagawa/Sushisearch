class SushisController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]  

  def maguro
    @sushis = Sushi.all
  end

  def salmon
    @sushis = Sushi.all
  end

  def saba
    @sushis = Sushi.all
  end

    def index
        @sushis = Sushi.all

        if params[:search] == nil
          @sushis= Sushi.all
        elsif params[:search] == ''
          @sushis= Sushi.all
        else

          @sushis = Sushi.where("sushiname LIKE ? ",'%' + params[:search] + '%')
        end

        @sushis = @sushis.page(params[:page]).per(3)
    end

    def new
        @sushi = Sushi.new
      end
    
      def create
        sushi = Sushi.new(sushi_params)

        sushi.user_id = current_user.id

        if sushi.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @sushi = Sushi.find(params[:id])
      end

      def edit
        @sushi = Sushi.find(params[:id])
      end

      def update
        sushi = Sushi.find(params[:id])
        if sushi.update(sushi_params)
          redirect_to :action => "show", :id => sushi.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        sushi = Sushi.find(params[:id])
        sushi.destroy
        redirect_to action: :index
      end

     

      private
      def sushi_params
        params.require(:sushi).permit(:sushiname, :highlight,:category, :image)
      end
    
end
