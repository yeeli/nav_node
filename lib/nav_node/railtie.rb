require 'nav_node/nav_helper'

module NavNode
  class Railtie < Rails::Railtie
    ActionView::Base.send :include, NavHelper
  end
end

