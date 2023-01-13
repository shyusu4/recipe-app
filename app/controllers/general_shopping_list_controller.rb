class GeneralShoppingListController < ApplicationController
  def index
    user_foods = current_user.foods
    all_foods = current_user.recipes.includes(recipe_foods: [:foods]).map do |recipe|
      recipe.recipe_foods.map(&:foods)
    end

    recipe_foods = all_foods.flatten
    @ingredients_to_buy = user_foods.select { |food| food unless recipe_foods.include?(food) }
    @total_foods = @ingredients_to_buy.count
    @total_price = @ingredients_to_buy.map(&:price).sum
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe)
  end
end
