require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Modelo valido" do
    m = Movie.new(title: "aaa", image: "12345", qualification: 5, gender: Gender.new)
    assert_equal true, m.valid?, "El modelo es valido"
  end

  test "Modelo no valido, todos sus atributos en nil" do
    m = Movie.new
    assert_equal false, m.valid?, "El modelo es invalido"
  end

  test "falta relacion con gender" do
    m = Movie.new(title: "aaa", image: "12345", qualification: 5)
    assert_equal false, m.valid?, "El modelo es valido, falta asociacion con gender"
  end

  test "qualificacion fuera de rango" do
    m = Movie.new(title: "aaa", image: "12345", qualification: 6, gender: Gender.new)
    assert_equal false, m.valid?, "qualification fuera de rango"
  end

  test "Modelo no valido, length image < 5" do
    m = Movie.new(title: "aaa", image: "1234", qualification: 5, gender: Gender.new)
    assert_equal false, m.valid?, "El modelo no es valido, longitud minima de image, 5"
  end

  test "Modelo no valido, longitud title >= 2" do
    m = Movie.new(title: "aa", image: "12345", qualification: 5, gender: Gender.new)
    assert_equal false, m.valid?, "El modelo no es valido, title < 3"
  end
end
