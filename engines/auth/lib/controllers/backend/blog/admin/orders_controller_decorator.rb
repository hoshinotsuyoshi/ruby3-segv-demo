module Blog::Admin::OrdersControllerDecorator
  def self.prepended(base)
  end
end
Blog::Admin::OrdersController.prepend(Blog::Admin::OrdersControllerDecorator)
