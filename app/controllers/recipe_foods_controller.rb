class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    if recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient was created successfully'
    else
      render :new, alert: 'Error: Ingredient not saved'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient was deleted successfully'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end
