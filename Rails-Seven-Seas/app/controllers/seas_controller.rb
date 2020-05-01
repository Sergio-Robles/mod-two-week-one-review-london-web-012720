class SeasController < ApplicationController
  #define your controller actions here

  def "/"

    erb :welcome
  end

  def index 
    @seas = Sea.all 
  end 

  def show 
    @sea = instance
  end 

  def new 
    @sea = Sea.new

  end 

  def edit 
    @sea = instance

  end 

  def create 
    @sea = Sea.create(sea_params)
    redirect_to seas_path 
  end 

  def update 
    @sea = instance
    @sea.update(sea_params)
  end 

  def destroy 
    @sea = instance
    @sea.destroy 
    redirect_to seas_path
  end 


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def instance
    Sea.find(params[:id])
  end 


end
