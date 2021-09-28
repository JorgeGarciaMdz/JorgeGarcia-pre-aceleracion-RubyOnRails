# json.character @character, :id, :name, :image, :age, :weight, :history
json.character do
  json.id @character.id
  json.name @character.name
  json.image @character.image
  json.age @character.age
  json.weight @character.weight
  json.history @character.history

  json.movies @character.movies.each do |m|
    json.title m.title
  end
end