class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.where(public: true).includes([:user])
    @ingredients = RecipeFood.all.includes([:food])
  end
end
