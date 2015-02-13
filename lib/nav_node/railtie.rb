module NavNode
  class Railtie < Rails::Railtie
    ActionView::Base.send :include, NavNode::NavHelper
  end
end

