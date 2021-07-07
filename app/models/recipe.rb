class Recipe < ApplicationRecord
  validates_uniqueness_of :ingredients
  validates_presence_of :ingredients, :image 
end
