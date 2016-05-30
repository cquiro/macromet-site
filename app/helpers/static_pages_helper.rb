module StaticPagesHelper
  def banner_named(name)
    Banner.find_by(name: name)
  end
end
