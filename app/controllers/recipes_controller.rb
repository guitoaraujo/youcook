# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    search_recipes = Recipes::Search.new(recipes_params)
    @recipes = search_recipes.call
    @most_common_tags = search_recipes.most_common_tags
    @filter = recipes_params[:filter]
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  private

  def recipes_params
    params.permit(:terms, :filter, :page)
  end
end
