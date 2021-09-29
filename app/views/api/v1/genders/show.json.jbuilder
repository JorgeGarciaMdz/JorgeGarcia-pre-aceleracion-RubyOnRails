if @gender
  json.gender @gender, :id, :name, :image
elsif @genders
  json.genders @genders, :id, :name, :image
end