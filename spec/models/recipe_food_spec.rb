require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  recipe = Recipe.create(name: 'Sushi', preparation_time: '2 hours', cooking_time: '20 minutes',
                         description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
  subject { RecipeFood.new(recipe_id: recipe.id, food_id: 1, quantity: 1) }
  before { subject.save }

  it 'should have quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'should have recipe_id' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have food_id' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end
end
