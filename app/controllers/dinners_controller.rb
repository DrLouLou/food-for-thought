class DinnersController < ApplicationController

  def index
    @dinners = Dinner.all
  end

  def show
    @dinner = Dinner.find(params[:id])
  end

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(dinner_params)
    if @dinner.save
      redirect_to dinner_path(@dinner)
    else
      render :new
  end

private

def dinner_params
  params.require(:dinner).permit(:location, :cuisine, :capacity, :price, :title, :datetime)
end

end
