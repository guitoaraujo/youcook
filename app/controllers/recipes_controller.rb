class RecipesController < ApplicationController

  def index
    @recipes = Recipes::Search.new(recipes_params[:terms]).call
  end  

  def show
    @recipe = Recipe.find params[:id]
  end

  private

    def recipes_params
      params.permit(:terms)
    end  
end