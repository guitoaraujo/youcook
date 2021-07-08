# frozen_string_literal: true

module ApplicationHelper
  def recipe_words(words)
    words.join(', ')
  end

  def search_filters
    %w[Ingredients Tags Name]
  end
end
