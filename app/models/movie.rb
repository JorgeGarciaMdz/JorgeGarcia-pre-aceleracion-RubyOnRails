# == Schema Information
#
# Table name: movies
#
#  id            :integer          not null, primary key
#  delete_at     :datetime
#  image         :string
#  qualification :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gender_id     :integer          not null
#
# Indexes
#
#  index_movies_on_gender_id  (gender_id)
#  index_movies_on_title      (title)
#
# Foreign Keys
#
#  gender_id  (gender_id => genders.id)
#
class Movie < ApplicationRecord
  belongs_to :gender
  has_and_belongs_to_many :characters, dependent: :destroy

  validates :image,
            presence: true,
            length: { minimum: 5, too_short: "must have at least %{count} characters"}

  validates :title,
            presence: true,
            length: {in: 3..150}

  validates :qualification,
            presence: true,
            #inclusion: 1..5,
            numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  scope :not_delete, -> { where( delete_at: nil)}

  scope :find_by_params, -> (params) {
    hash_params = Hash.new
    params.each do |key, value|
      logger.info "#{key}   #{value}"
      if ( key == :gender_id)
        hash_params[:gender_id] = value
      elsif (key == :title)
        hash_params[:title] = '%' + value + '%'
      end
    end

    query = ''

    hash_params.each_with_index do|(key, value), index|
      logger.info " #{key}  #{value}  #{index}"
      if ( key == :gender_id)
        query += " gender_id = :#{key} " 
      else
        query += " #{key} like :#{key} "
      end

      if hash_params.length > (index + 1 )
        query += " and "
      end
    end
    if params["order"]
      if params["order"].upcase == 'DESC'
        where( query, hash_params).where(delete_at: nil).order(:created_at).reverse_order
      else
        where( query, hash_params).where(delete_at: nil).order(:created_at)
      end
    else
      where( query, hash_params).where(delete_at: nil).order(:created_at)
    end
  }

  def destroy
    update_attribute( :delete_at, Date.today)
    self.characters.each do |c|
      c.destroy
    end
  end
end
