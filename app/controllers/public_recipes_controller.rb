class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.where(public: true)
  end

  def public_recipes
    @public_recipes = Recipe.includes([:user]).where(public: true).order(created_at: :desc)
  end
end
