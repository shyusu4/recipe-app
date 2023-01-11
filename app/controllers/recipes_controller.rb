class RecipesController < ApplicationController
    def index
      @recipes = current_user.recipes
    end

    def show
      @recipe = Recipe.find(params[:id])
    end
  
    def new
      @recipe = Recipe.new
    end

    def update_public
      @recipe = Recipe.find(params[:id])
      flash[:notice] = if recipe.update(public: !recipe.public)
                         "Successfully updated to #{recipe.public ? 'Public' : 'Private'}."
                       else
                         'Failed to update recipe.'
                       end
      redirect_to "/users/#{current_user.id}/recipes/#{recipe.id}"
    end
  
    def create
      @recipe = Recipe.new(recipe_params)
      @recipe.user = current_user
      if @recipe.save
        redirect_to recipes_path, notice: 'Recipe was created successfully'
      else
        render :new, alert: 'Error: Recipe not saved'
      end
    end
  
    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy 
      redirect_to recipes_path, notice: 'Recipe was deleted successfully'
    end
  
    def recipe_params
      params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
    end
end
