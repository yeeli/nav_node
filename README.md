# NavNode

Nav for rails 

## Installation

Add this line to your application's Gemfile:

```
gem 'nav_node'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nav_node

## Usage

with erb

```
  <%= render_nav class: 'menu' do |node| %>
    <%= node.+ "Node1", "/node1", class: "menu-node1", match: ['/node1', '/node2'] %>
    <%= node.+ "Node2", "/node2", class: "menu-node2", match: '/node2/*' %>
  <% end %>
```

with Slim

```

  = render_nav class: 'menu' do |node|
    - node.+ "Node1", "/node1", class: 'menu-node1', match: ['/node1', '/node2']
    - node.+ "Node2", "/node2", class: 'menu-node2', match: '/node2/*'
```

in "node1" page output 

```
  <ul class="inline-menu">
    <li class="first">
      <a href="/node1"><span>Node1</span></a>
      </li>
      <li class="last active">
        <a href="/node2"><span>Node2</span></a>
      </li>
   </ul>
```

in "node2" page output

```
  <ul class="inline-menu">
    <li class="first active">
      <a href="/node1"><span>Node1</span></a>
      </li>
      <li class="last active">
        <a href="/node2"><span>Node2</span></a>
      </li>
   </ul>
```

## License

Copyright © 2015, Ye Li. Released under the MIT License
