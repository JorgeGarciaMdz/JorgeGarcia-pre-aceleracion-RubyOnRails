class Api::V1::GendersController < Api::V1::PrivateController

  before_action :set_gender, only: [:show, :update, :destroy]

  def index
  end

  def show
    if params[:id]
      logger.info " id  #{params[:id]}"
      @gender = Gender.find_by(id: params[:id], delete_at: nil)
    elsif params[:name]
      @gender = Gender.where("name like ?", '%' + params[:name] + '%').not_delete
    else
      logger.info " sin id"
      @genders = Gender.not_delete
    end
  end

  def create
    @gender = Gender.new(gender_params)
    if @gender.valid?
      if @gender.save
        render json: {
          "gender": {
            "id": @gender.id,
            "name": @gender.name,
            "image": @gender.image
          }
        }
      else
        render json: {
          error: @gender.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {
        error: @gender.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    if @gender
      if @gender.update(gender_params)
        render json: {
          "gender": {
            "id": @gender.id,
            "name": @gender.name,
            "image": @gender.image
          }
        }
      else
        render json: {
          error: @gender.errors
        }, status: :unprocessable_entity
      end
    else
      render json: {
        message: "no gender with id: #{params[:id]} found"
      }, status: :bad_request
    end
  end

  def destroy
    if @gender
      @gender.destroy
    else
      render json: {
        message: "no gender with id: #{params[:id]} found"
      }, status: :bad_request
    end
  end

  private 
  def set_gender
    @gender = Gender.find_by(:id => params[:id], :delete_at => nil)
  end

  def gender_params
    params.require(:gender).permit(:name, :image)
  end
end
