# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipes::Search.new(recipes_params[:terms], recipes_params[:page]).call
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  private

  def recipes_params
    params.permit(:terms, :page)
  end
end
