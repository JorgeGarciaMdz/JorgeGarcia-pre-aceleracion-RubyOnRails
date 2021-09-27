# == Schema Information
#
# Table name: genders
#
#  id         :integer          not null, primary key
#  delete_at  :datetime
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_genders_on_name  (name)
#
class Gender < ApplicationRecord
  has_many :movies, dependent: :destroy
  
  scope :not_delete, -> { where( delete_at: nil)}

  validates :name,
            presence: true,
            length: {in: 3..150}

  validates :image,
            presence: true,
            length: {minimum: 10, too_short: "must have at least %{count} characters"}

  def destroy
    update_attribute( :delete_at, Date.today)
    self.movies.each do |m|
      m.destroy
    end
  end
end
