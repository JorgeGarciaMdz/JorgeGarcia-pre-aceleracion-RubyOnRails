# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

list_genders = [
  #[image, name]
  ["url image romantico", "romantico"],
  ["url image accion", "accion"],
  ["url image animacion", "animacion"],
  ["url image ficcion", "ficcion"]
]

list_genders.each do |image, name|
  Gender.create(:image => image, :name => name)
end

list_movies = [
  #[image, title, quialification, gender_id]
  ["url image bajo el mismo cielo", "Bajo el mismo cielo", 3, 1],
  ["url image historia de una pasion", "Historia de una pasion", 2, 1],
  ["url image Rambo", "Rambo 1", 2, 2],
  ["url image rambo 2", "Rambo 2", 3, 2],
  ["url image cars", "Cars", 4, 3],
  ["url image Cubo", "Cubo", 3, 3],
  ["url image Turbo", "Turbo", 4, 3]
]

list_movies.each do |i, t, q, g|
  Movie.create(:image => i, title: t, qualification: q, :gender_id => g)
end

list_characters_m = [
  #[image, name, age, weight, history, movie_id]
  ["url image kevin", "kevin", 12, 1.4, "alguien llamado kevin"],
  ["url image braian", "braian", 13, 1.5, "alguien llamado braian"],
  ["url image geni", "geni", 14, 1.3, "alguien llamado geni"]
]

list_characters_p = [
  ["url image bolton", "bolton", 23, 1.7, "alguien llamado bolton"],
  ["url image droco", "droco", 24, 2.1, "alguien llamado droco"]
]

list_characters_r = [
  ["url image rambo", "Rambo", 21, 1.6, "alguien llamado rambo"],
  ["url image coronel", "Coronel", 57, 1.6, "don coronel"]
]

list_characters_m.each do |i, n, a, w, h|
  Movie.find(1).characters << Character.create(image: i, name: n, age: a, weight: w, history: h )
end

list_characters_p.each do |i, n, a, w, h|
  Movie.find(2).characters<< Character.create(image: i, name: n, age: a, weight: w, history: h )
end

list_characters_r.each do |i, n, a, w, h|
  Movie.find(1).characters << Character.create(image: i, name: n, age: a, weight: w, history: h )
end
