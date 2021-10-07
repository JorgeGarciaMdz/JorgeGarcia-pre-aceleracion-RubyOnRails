class Api::V1::CharactersController < Api::V1::PrivateController
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    @characters = Character.find_by_params(filter_params)
  end

  def show
    if params[:id]
      if @character
        @character
      end
    else
      @characters = Character.find_by_params(filter_params)
    end
  end

  def create
    movie_id = params[:movie_id]
    @character = Character.new(character_params)
    if @character.invalid?
      render json: { 
        error: @character.errors
      }, status: :unprocessable_entity
    else
      @movie = Movie.find_by(id: movie_id, delete_at: nil)
      if @movie
        if @character.save
          @movie.characters << @character
          @character
        else
          render json: { 
            error: @character.errors
          }, status: :unprocessable_entity
        end
      else
        render json: {
          message: "no movie with id: #{movie_id} found"
        }, status: :bad_request
      end
    end
  end

  def update
    if @character
      if @character.update(character_params)
        @character
      else
        render json: {
          errors: @character.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {
        message: "no character with id: #{params[:id]} found"
      }, status: :bad_request
    end
  end

  def destroy
    if @character
      @character.destroy
    else
      render json: {
        message: "no character with id: #{params[:id]} found"
      }, status: :bad_request
    end
  end

  private
  def set_character
    @character = Character.find_by( id: params[:id], delete_at: nil)
  end

  def character_params
    params.require(:character).permit(:name, :image, :age, :weight, :history)
  end

  def filter_params
    hash_params = Hash.new
    params.permit(:name, :image, :age, :movies).each do |key, value|
      if value.class == String && value.size > 0 && key != "movies" && key != "age"
        hash_params[key] = value
      elsif key == "movies" && value.to_i > 0 || key == "age" && value.to_i > 0
        hash_params[key] = value
      end
    end
    hash_params
  end
end
