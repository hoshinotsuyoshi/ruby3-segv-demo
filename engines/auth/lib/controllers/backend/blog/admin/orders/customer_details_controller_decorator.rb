module Blog::Admin::Orders::CustomerDetailsControllerDecorator
  def self.prepended(base)
  end
end
Blog::Admin::Orders::CustomerDetailsController.prepend(Blog::Admin::Orders::CustomerDetailsControllerDecorator)
