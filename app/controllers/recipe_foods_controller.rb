class RecipeFoodsController < ApplicationController
    def index
        @recipe_foods = RecipeFood.all
    end
  
    def new
      @recipe_food = RecipeFood.new
    end
  
    def create
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.recipe_id = params[:recipe_id]
        @recipe_food.food_id = params[:food_id]
  
      if @recipe_food.save
        redirect_to recipe_path(id: :recipe_id), notice: 'Ingredient was created successfully'
      else
        render :new, alert: 'Error: Ingredient not saved'
      end
    end
  
    def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = RecipeFood.find(params[:id])
        @recipe_food.destroy
        redirect_to @recipe, notice: 'Ingredient was deleted successfully'
    end

    private
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
  end