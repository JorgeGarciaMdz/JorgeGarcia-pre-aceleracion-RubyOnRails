if @movie
  json.movie do 
    json.id @movie.id
    json.title @movie.title
    json.image @movie.image
    json.qualification @movie.qualification
    json.created_at @movie.created_at
    json.characters @movie.characters.each do |c|
      json.id c.id
      json.name c.name
    end
  end
elsif @movies 
  json.movies @movies, :id, :title, :image, :created_at
end