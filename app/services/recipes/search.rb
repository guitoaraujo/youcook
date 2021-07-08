# frozen_string_literal: true

module Recipes
  class Search
    def initialize(params)
      @terms = params[:terms]
      @filter = params[:filter]
      @page = params[:page]
    end

    def call
      return Recipe.order(:name).page(@page) unless @terms.present?

      case @filter.downcase.to_sym
      when :tags
        set_response_array
      when :name
        Recipe.where(name: @terms).order(:name).page(@page)
      else
        set_response_array
      end
    end

    private

    def set_response_array
      array = []
      @terms.split.each do |term|
        array << Recipe.where("array_to_string(#{@filter.downcase}, '||') ILIKE :term",
                              term: "%#{term}%").order(:name)
      end
      array.flatten.any? ? array.flatten.uniq : array.flatten
    end
  end
end
