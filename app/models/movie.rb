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

  scope :not_delete, -> { where( delete_at: nil)}

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

  def destroy
    update_attribute( :delete_at, Date.today)
    self.characters.each do |c|
      c.destroy
    end
  end
end
