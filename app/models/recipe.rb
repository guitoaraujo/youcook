class Recipe < ApplicationRecord
  validates_uniqueness_of :ingredients
  validates_presence_of :ingredients, :image
  
  paginates_per 10
end
