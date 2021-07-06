File.open("recipes.json", "r").each_line do |line|
  data = JSON.parse line
  Recipe.create(
    rate: data["rate"],
    author_tip: data["author_tip"],
    budget: data["budget"],
    prep_time: data["prep_time"],
    ingredients: data["ingredients"],
    name: data["name"],
    author: data["author"],
    difficulty: data["difficulty"],
    people_quantity: data["people_quantity"],
    cook_time: data["cook_time"],
    tags: data["tags"],
    total_time: data["total_time"],
    image: data["image"],
    nb_comments: data["nb_comments"]
  )
end
