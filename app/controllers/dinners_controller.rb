class DinnersController < ApplicationController

  def index
    @dinners = Dinner.all
  end

  def show
    find_dinner_id
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
  end

  def edit
    find_dinner_id
  end

  def update
    find_dinner_id
    @dinner.update(dinner_params)
    redirect_to dinner_path(@dinner)
  end

  def destroy
    find_dinner_id
    @dinner.destroy
    redirect_to dinners_path
  end

  private

  def dinner_params
    params.require(:dinner).permit(:location, :cuisine, :capacity, :price, :title, :datetime)
  end

  def find_dinner_id
    @dinner = Dinner.find(params[:id])
  end

end
