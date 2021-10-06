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
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Modelo no valido, atributos con valor nil" do
    m = Movie.new
    assert_equal false, m.valid?, "El modelo no es valido"
  end

  
end
