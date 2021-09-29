if @movies
  json.movies @movies, :id, :title, :image, :created_at
end