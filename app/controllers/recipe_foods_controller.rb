class RecipeFoodsController < ApplicationController
    def index
        @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    end
  
    def new
      @recipe_food = RecipeFood.new
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def create
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.recipe_id = params[:recipe_id]
  
      if @recipe_food.save
        redirect_to recipes_path(id: :recipe_id), notice: 'Ingredient was created successfully'
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
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
  end