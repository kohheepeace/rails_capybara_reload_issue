# Issue Overview

During testing with Capybara, I use binding.irb to pause the process temporarily.

At that time, I modify the code and reload the browser.

The reload time is very long and I would like to know the cause and how to improve it.

https://github.com/kohheepeace/rails_capybara_reload_issue/assets/29557494/279de7e9-8075-4c03-ad0b-21d6614f71cc


## Environment
- ruby "3.2.2"
- rails (7.1.3.2)
- rspec-core (3.13.0)
- capybara (3.40.0)


## Steps


1. set `config.enable_reloading = true` in `config/environments/test.rb

```ruby
Rails.application.configure do
...
	config.enable_reloading = true
...
end
```

2. call `binding.irb` in system spec

`spec/system/example_spec.rb`

```ruby
require 'rails_helper'

RSpec.describe 'example', type: :system do
  before do
    driven_by :selenium, using: :chrome, screen_size: [600, 600]
  end

  describe '#root' do
    it 'works as expected' do
      visit posts_path

      binding.irb
    end
  end
end
```

3. change the view code

ex: `app/views/posts/index.html.erb`

```ruby
<p style="color: green"><%= notice %></p>

<h1>Posts Hello World</h1>

<div id="posts">
  <% @posts.each do |post| %>
    <%= render post %>
    <p>
      <%= link_to "Show this post", post %>
    </p>
  <% end %>
</div>

<%= link_to "New post", new_post_path %>
```
