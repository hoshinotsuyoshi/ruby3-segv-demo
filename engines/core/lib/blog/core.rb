# This is required because ActiveModel::Validations#invalid? conflicts with the
# invalid state of a Payment. In the future this should be removed.
module Blog
  mattr_accessor :user_class

  def self.user_class(constantize: true)
    if @@user_class.is_a?(Class)
      raise 'Blog.user_class MUST be a String or Symbol object, not a Class object.'
    elsif @@user_class.is_a?(String) || @@user_class.is_a?(Symbol)
      constantize ? @@user_class.to_s.constantize : @@user_class.to_s
    end
  end

  def self.admin_path
    'admin'
  end

  def self.admin_path=(path)
    'admin'
  end

  def self.config
    yield(Blog::Config)
  end

  def self.dependencies
    yield(Blog::Dependencies)
  end

  module Core
    class GatewayError < RuntimeError; end
    class DestroyWithOrdersError < StandardError; end
  end
end

require 'blog/core/version'
require 'blog/core/engine'
