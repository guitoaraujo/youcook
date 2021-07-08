# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipes::Search.new(recipes_params).call
    @filter = recipes_params[:filter]
    @most_common_tags = count_tags
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  private

  def recipes_params
    params.permit(:terms, :filter, :page)
  end

  def count_tags
    tags = Recipe.all.map(&:ingredients).flatten
    hash = Hash.new(0)
    tags.each do |tag|
      hash[tag] += 1
    end
    hash.sort_by { |_tag, n| n }.reverse.first(5)
  end
end
