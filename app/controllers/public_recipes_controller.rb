class PublicRecipesController < ApplicationController
    def index
        @recipes = Recipe.all.where(public: true).includes([:user])
    end
  
    def public_recipes
      @public_recipes = Recipe.includes([:user]).where(public: true).order(created_at: :desc)
    end
end