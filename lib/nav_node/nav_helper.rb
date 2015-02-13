require 'active_support/core_ext/string/output_safety'

module NavNode
  module NavHelper
    def render_nav(options = {})
      nav_node = NavNode::Node.new

      yield(nav_node) if block_given?

      if options[:tag]
        if ["ul", "dl", "ol"].include?(options[:tag])
          nav_tag = options[:tag]
        end
      end

      nav_tag ||= "ul"
      full_path = if respond_to?(:request)
                    request.fullpath
                  else
                    "/"
                  end

      node_html = nav_node.parse_list(full_path, "").join("")
      list_html = "<#{nav_tag} class='#{options[:class]}'>#{node_html}</#{nav_tag}>"
      list_html.html_safe
    end
  end
end
