class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    @characters = Character.not_delete
  end

  def show
    if params[:id]
      if @character
        @character
      end
    else
      index
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
end
