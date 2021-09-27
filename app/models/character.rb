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
