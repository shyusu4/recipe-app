require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jennie') }
  before { subject.save }

  it 'should have name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
    it 'has_many foods' do
      assoc = User.reflect_on_association(:foods)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many recipes' do
      assoc = User.reflect_on_association(:recipes)
      expect(assoc.macro).to eq :has_many
    end
end