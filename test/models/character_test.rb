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
require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Validations:
  # length image >= 10
  # length name >= 3
  # age in {1..200}
  # weight > 0.0
  # history >= 10

  test "Modelo valido" do 
    c = Character.new(name: "123", image: "1234567890", age: 1, weight: 2.1, history: "1234567890")
    assert_equal true, c.valid?, "Modelo valido"
  end

  test "Modelo no valido, length history < 10" do 
    c = Character.new(name: "123", image: "1234567890", age: 1, weight: 2.1, history: "123456789")
    assert_equal false, c.valid?, "length history < 10"
  end

  test "Modelo no valido, weight < 0" do 
    c = Character.new(name: "123", image: "1234567890", age: 1, weight: -1, history: "1234567890")
    assert_equal false, c.valid?, "Modelo no valido, weight < 0"
  end

  test "Modelo no valido, length name < 3" do 
    c = Character.new(name: "12", image: "1234567890", age: 1, weight: 2.1, history: "1234567890")
    assert_equal false, c.valid?, "length name < 3"
  end

  test "Modelo no valido, length image < 10" do 
    c = Character.new(name: "123", image: "123456789", age: 1, weight: 2.1, history: "1234567890")
    assert_equal false, c.valid?, "length image < 10"
  end

  test "Modelo no valido, age < 1" do 
    c = Character.new(name: "123", image: "1234567890", age: 0, weight: 2.1, history: "1234567890")
    assert_equal false, c.valid?, "Modelo valido, age < 1"
  end

  test "Modelo no valido, age > 200" do 
    c = Character.new(name: "123", image: "1234567890", age: 201, weight: 2.1, history: "1234567890")
    assert_equal false, c.valid?, "Modelo valido, age > 201"
  end
end
