module Blog::Admin::BaseControllerDecorator
end
Blog::Admin::BaseController.prepend(Blog::Admin::BaseControllerDecorator)
