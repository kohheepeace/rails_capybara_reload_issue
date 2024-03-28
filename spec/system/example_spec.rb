require 'rails_helper'

RSpec.describe 'example', type: :system do
  before do
    driven_by :selenium, using: :chrome, screen_size: [600, 600]
  end

  it 'is ok' do
    visit posts_path

    binding.irb
  end
end
