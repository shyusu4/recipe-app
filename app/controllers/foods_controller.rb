class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path(@food), notice: 'Food was created successfully'
    else
      render :new, alert: 'Error: Food not saved'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was deleted successfully'
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
