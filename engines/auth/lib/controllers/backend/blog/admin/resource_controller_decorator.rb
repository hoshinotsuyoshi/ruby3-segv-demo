module Blog::Admin::ResourceControllerDecorator
  def self.prepended(base)
  end
end
Blog::Admin::ResourceController.prepend(Blog::Admin::ResourceControllerDecorator)
