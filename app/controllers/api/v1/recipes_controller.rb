# frozen_string_literal: true

class Api::V1::RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    search_recipes = Recipes::Search.new(recipes_params)    

    render json: { recipes: search_recipes.call, most_common_tags: search_recipes.most_common_tags, filter: recipes_params[:filter] }
  end

  def show
    recipe = Recipe.find params[:id]

    render json: { recipe: recipe }
  end

  private

  def recipes_params
    params.permit(:terms, :filter, :page)
  end
end