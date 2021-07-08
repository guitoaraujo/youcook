# frozen_string_literal: true

module Recipes
  class Search
    def initialize(terms, page)
      @terms = terms
      @page = page
    end

    def call
      return Recipe.order(:name).page(@page) unless @terms.present?

      array = []
      @terms.split.each do |term|
        array << Recipe.where("array_to_string(ingredients, '||') ILIKE :term", term: "%#{term}%").order(:name)
      end
      array.flatten.any? ? array.flatten.uniq : array.flatten
    end
  end
end