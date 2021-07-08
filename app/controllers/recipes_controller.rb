# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipes::Search.new(recipes_params).call
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
