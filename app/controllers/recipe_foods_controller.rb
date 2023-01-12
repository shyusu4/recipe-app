class RecipeFoodsController < ApplicationController
    def index
      @recipe_foods = RecipeFood.all
    end
  
    def new
      @recipe_food = RecipeFood.new
      @recipe = Recipe.find(params[:recipe_id])
      @foods = Food.where(user_id: current_user.id)
    end
  
    def create
      @recipe_food = RecipeFood.new(params.require(:recipe_food).permit(:quantity, :food_id))
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_food.id = @recipe.id
  
      if @recipe_food.save
        redirect_to recipes_path, notice: 'Ingredient was created successfully'
      else
        render :new, alert: 'Error: Ingredient not saved'
      end
    end
  
    def destroy
      RecipeFood.find(params[:id]).destroy
      redirect_to recipe_path(params[:recipe_id])
    end
  end