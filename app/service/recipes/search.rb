class Recipes::Search 
  def initialize(terms)
    @terms = terms
  end
  
  def call
    return Recipe.all unless @terms.present?

    array = []
    terms.split.each do |term|      
      array << Recipe.where("array_to_string(ingredients, '||') LIKE :term", term: "%#{term}%")
    end
    array.flatten.uniq
  end  
end