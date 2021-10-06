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

  test "no debe guardar gender sin atributos" do
    g = Gender.new
    assert_not g.save, "los atributos image and name no pueden ser nulos"
  end

  test "Se guarda instancia de gender correctamente cumpliendo con validaciones de modelo" do
    g = Gender.new
    g.name = "names"
    g.image = "imagetenCharacters"
    assert_equal true, g.save, "Cumplen con las restricciones de variables"
  end

  test "name and image no cumplen con las validaciones" do
    g = Gender.new
    g.name = "o"
    g.image = "a"
    assert_equal false, g.save, "las varibles no cumplen con las validaciones"
  end

  test "name cumple con validacion, image no cumple" do 
    g = Gender.new
    g.name = "name"
    g.image = "a" 
    assert_equal false, g.save, "image no cumple con la validacion del modelo"
  end 

  test "image cumple la validacion del modelo, name no" do
    g = Gender.new
    g.name = "o"
    g.image = "imageTenCharacter"
    assert_equal false, g.save, "name no cumple con validacion de modelo"
  end
end
