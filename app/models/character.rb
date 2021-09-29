# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  age        :integer
#  delete_at  :datetime
#  history    :text
#  image      :string
#  name       :string
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_characters_on_name  (name)
#
class Character < ApplicationRecord
  #belongs_to :movie
  has_and_belongs_to_many :movies

  scope :not_delete, -> { where( delete_at: nil)}

  scope :find_by_params, -> (params) {
    #where(delete_at: nil).includes(:movies).where(movies: {id: 3})
    
    hash_params = Hash.new

    params.each do |key, value|
      if ( key == 'movies')
        hash_params[:movies] = value
      elsif (key == 'name')
        hash_params[:name] = '%' + value + '%'
      elsif (key == 'age')
        hash_params[:age] = '%' + value + '%'
      elsif (key == 'weight')
        hash_params[:weight] = '%' + value + '%'
      end
    end

    query = ''

    if hash_params.key?(:movies)
      hash_params.each_with_index do |(key, value), index|
        if key != :movies
          query += " #{key} like :#{key} "
        end
        if hash_params.length > (index + 2 )
          query += " and "
        end
      end
      where( query, hash_params).where(delete_at: nil).includes(:movies).where(movies: {id: hash_params[:movies]})
    else
      hash_params.each_with_index do |(key,value), index|
        query += " #{key} like :#{key} "
        if hash_params.length < ( index + 1)
          query += " and "
        end
      end
      where(query, hash_params).not_delete
    end
  }

  validates :image,
            presence: true,
            length: {minimum: 10, too_short: "must have at least %{count} characters"}

  validates :name,
            presence: true,
            length: { in: 3..150 }

  validates :age,
            presence: true,
            #numericality: true,
            numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200}
    
  validates :weight,
            presence: true,
            numericality: {only_float: true, greater_than: 0.0}

  validates :history,
            presence: true,
            length: {minimum: 10, too_short: "must have at least %{count} characters"}

  def destroy
    update_attribute( :delete_at, Date.today)
  end
end
