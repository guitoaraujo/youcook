class RecipesController < ApplicationController

  def index
    terms = recipes_params[:terms]
    if terms.present?
      array = []
      terms.split.each do |term|      
        array << Recipe.where("array_to_string(ingredients, '||') LIKE :term", term: "%#{term}%")
      end
      @recipes = array.flatten.uniq
    else
      @recipes = Recipe.all
    end
  end  

  def show
    @recipe = Recipe.find params[:id]
  end

  private

    def recipes_params
      params.permit(:terms)
    end  
end