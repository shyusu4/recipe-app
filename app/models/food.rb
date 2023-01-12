class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy
  
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal: 0 }
end
