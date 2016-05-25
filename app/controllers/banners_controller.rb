class BannersController < ApplicationController

  def edit
    @banner1 = Banner.find_by(name: "Banner 1")
    @banner2 = Banner.find_by(name: "Banner 2")
    @banner3 = Banner.find_by(name: "Banner 3")
  end

  def update
    @banner1 = Banner.find_by(name: "Banner 1")
    @banner2 = Banner.find_by(name: "Banner 2")
    @banner3 = Banner.find_by(name: "Banner 3")
  end
end
