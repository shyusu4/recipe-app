require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'John Doe')
    @recipe = Recipe.create(user_id: @user, name: 'Sushi', preparation_time: '1 hour', cooking_time: '20 minutes',
                            description: 'Lorem ipsum', public: false)
  end

  it 'should be named sushi' do
    expect(@recipe.name).to eql('Sushi')
  end

  it 'should have preparation_time of 1 hour' do
    expect(@recipe.preparation_time).to eql('1 hour')
  end

  it 'should have cooking_time of 20 minutes' do
    expect(@recipe.cooking_time).to eql('20 minutes')
  end

  it 'should have desciption' do
    expect(@recipe.description).to eql('Lorem ipsum')
  end

  it 'has_many recipes' do
    assoc = Recipe.reflect_on_association(:recipe_foods)
    expect(assoc.macro).to eq :has_many
  end

  it 'belongs_to user' do
    assoc = Recipe.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end
end
