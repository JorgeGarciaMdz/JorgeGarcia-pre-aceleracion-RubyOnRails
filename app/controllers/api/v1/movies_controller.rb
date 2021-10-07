class Api::V1::MoviesController < Api::V1::PrivateController
  before_action :set_movie, only: [:show, :update, :destroy]
  def index
    @movies = Movie.find_by_params(filter_params)
  end

  def show
    if params[:id]
      if @movie
        @movie
      end
    else
      @movies = Movie.find_by_params(filter_params)
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: {
        "movie": {
          "id": @movie.id,
          "title": @movie.title,
          "image": @movie.image,
          "qualification": @movie.qualification
        }
      }
    else
      render json: {
        errors: @movie.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @movie
      if @movie.update(movie_params)
        @movie
      else
        render json: {
          errors: @movie.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {message: "no entity with id: #{params[:id]} found"} , status: :not_found
    end
  end

  def destroy
    if @movie
      if @movie.destroy
      else
        render json: {
          errors: @movie.errors
        }, status: :bad_request
      end
    else
      render json: {
        message: "no entity with id: #{params[:id]} found" 
      }, status: :bad_request
    end
  end

  private
  def set_movie
    @movie = Movie.find_by(id: params[:id], delete_at: nil)
  end

  def filter_params
    hash_params = Hash.new
    params.permit(:name, :genre, :order).each do |key, value|
      if key == "name"
        hash_params[:title] = value
      elsif key == "genre"
        hash_params[:gender_id] = value
      else
        hash_params[key] = value
      end
    end
    hash_params
  end
  
  def movie_params
    params.require(:movie).permit(:title, :image, :qualification, :gender_id)
  end
end
