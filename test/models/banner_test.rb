require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  def setup
    @banner = Banner.new(name: "Banner 1",
                          title: "IMPULSO E INNOVACIÓN PARA SU MARCA",
                          subtitle: "Ocho años conectando productos de calidad con el consumidor final",
                          button: "Exhibición",
                          image: "Some Image")
  end

  test "should be valid" do
    assert @banner.valid?
  end

  test "instances should exist" do
    assert Banner.find_by name: "Banner 1"
  end
end
