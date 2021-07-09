# frozen_string_literal: true

module Recipes
  class Search
    attr_reader :most_common_tags

    def initialize(params)
      @terms = params[:terms]
      @filter = params[:filter]
      @page = params[:page]
      @most_common_tags = set_common_tags
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

    def set_common_tags
      tags = Recipe.all.map(&:ingredients).flatten
      hash = Hash.new(0)
      tags.each do |tag|
        hash[tag] += 1
      end
      hash.sort_by { |_tag, n| n }.reverse.first(5)
    end
  end
end
