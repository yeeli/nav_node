require "nav_node/version"
require 'nav_node/node'
require 'nav_node/nav_helper'

module NavNode
  class << self
    include NavNode::NavHelper
  end
end


require 'nav_node/railtie' if defined?(Rails)
