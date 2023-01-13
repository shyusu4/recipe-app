require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @food = Food.new(user_id: @user, name: 'Apple', measurement_unit: 'grams', price: 1.59, quantity: 4)
  end

  it 'should be named apple' do
    expect(@food.name).to eql('Apple')
  end

  it 'should have price of 2' do
    expect(@food.price).to eql(1.59)
  end

  it 'should have measurement_unit grams' do
    expect(@food.measurement_unit).to eql('grams')
  end
end
