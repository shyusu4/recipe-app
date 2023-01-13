require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'John Doe')
    @recipe = Recipe.create(user: @user, name: 'Sushi', preparation_time: '1 hour', cooking_time: '20 minutes',
                            description: 'Lorem ipsum', public: false)
    @food = Food.create(user: @user, name: 'Salmon', measurement_unit: 'grams', price: 17.55, quantity: 3)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 2)
  end

    it 'should have valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'should have quantity of 2' do
      expect(@recipe_food.quantity) eql(2)
    end

    it 'belongs_to recipe' do
      assoc = RecipeFood.reflect_on_association(:recipe)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      assoc = RecipeFood.reflect_on_association(:food)
      expect(assoc.macro).to eq :belongs_to
    end
end