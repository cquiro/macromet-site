require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  def setup
    @banner = Banner.new(name: "Banner 1",
                          title: "IMPULSO E INNOVACIÓN PARA SU MARCA",
                          subtitle: "Ocho años conectando productos de calidad con el consumidor final",
                          button: "Exhibición",
                          image: "Some Image")
    load "#{Rails.root}/db/seeds.rb"
  end

  test "should be valid" do
    assert @banner.valid?
  end

  test "instances should exist" do
    assert Banner.find_by name: "Banner 1"
  end

  test "should update banner" do
    banner = Banner.find_by name: "Banner 1"
    updated_title = "Updated"
    updated_subtitle = "Updated banner test"

    put :update, banner: { id: banner.id, title: updated_title, subtitle: updated_subtitle }

    assert_equal updated_title, banner.title
    assert_equal updated_subtitle, banner.subtitle
  end
end
