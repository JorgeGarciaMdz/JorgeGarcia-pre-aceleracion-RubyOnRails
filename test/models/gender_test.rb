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
require "test_helper"

class GenderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
