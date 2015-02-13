module NavNode
  class Node
    attr_accessor :list

    def initialize
      @list = []
    end

    def add(content, path = nil, options = {})
      if !path.nil? || path != ""
        @list << { type: :link, content: content, path: path, options: options }
      else
        @list << {content: content, options: options}
      end
    end
    alias_method :+, :add 

    def parse_list(request_path, root_path = nil)
      nodes = []
      list.each_with_index do |value, index|
        node_match = value[:options][:match]
        node_type = value[:type]
        node_path = value[:path]
        node_class = []
        node_content = ""
        node_class<< "first" if index == 0 
        node_class << "last" if index == list.length - 1
        if url_match(node_match, request_path, node_type, node_path)
          node_class << "active"
        end
        if node_type == :link
          link_class = " class='#{value[:class]}'" if value[:class]
          nodes << "<li class='#{node_class.join(" ")}'><a href='#{node_path}'#{link_class}>#{value[:content]}</a></li>"
        else
          nodes << "<li class='#{node_class.join(" ")}'>#{value[:content]}</li>"
        end
      end
      nodes 
    end

    def url_match(node_match, request_path, node_type, node_path)
      match = false
      if node_match
        if node_match.is_a?(String)
          if request_path.match(%r"#{node_match}")
            match = true
          end
        end
        if node_match.is_a?(Array)
          node_match.each do |nm|
            if request_path.match(%r"#{nm}")
              match = true
              break
            end
          end
        end
      else
        if node_type == :link
          if request_path == node_path
            match = true
          end
        end
      end
      return match
    end
  end
end
