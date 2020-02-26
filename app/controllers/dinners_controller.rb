class DinnersController < ApplicationController
  before_action :find_dinner_id, only: [:show, :edit, :update, :destroy]

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
    @dinner.user = current_user
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
    params.require(:dinner).permit(:cuisine, :capacity, :price, :title)
  end

  def find_dinner_id
    @dinner = Dinner.find(params[:id])
  end

end
