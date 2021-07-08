FactoryBot.define do
  factory :recipe do
    rate            { rand(0..5) }
    author_tip      { 'easy and cheap' }
    budget          { 'cheap' }
    prep_time       { '30 min' }
    ingredients     { ["ing_#{rand(1..1000)}", "ing_#{rand(1..1000)}", "ing_#{rand(1..1000)}"] }
    name            { 'Delicious food' }
    author          { 'author' }
    difficulty      { 'easy' }
    people_quantity { rand(0..10) }
    cook_time       { '30 min' }
    tags            { ['tag_1', 'tag_2', 'tag_3'] }
    total_time      { '1h' }
    image           { 'https://x.yummlystatic.com/web/Recipe-default-03.jpg' }
    nb_comments     { rand(0..1000) }
  end
  
  factory :recipes_list do
    create_list { :recipe }
  end
  
  trait :recipe_with_defined_ingredients do
    ingredients{  ['ing_100', 'ing_200', 'ing_300'] }
  end

end