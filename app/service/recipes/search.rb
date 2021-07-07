class Recipes::Search 
  def initialize(terms, page)
    @terms = terms
    @page = page
  end
  
  def call
    return Recipe.order(:name).page(@page) unless @terms.present?

    array = []
    terms.split.each do |term|      
      array << Recipe.where("array_to_string(ingredients, '||') LIKE :term", term: "%#{term}%")
    end
    array.flatten.uniq.order(:name).page(@page)
  end  
end