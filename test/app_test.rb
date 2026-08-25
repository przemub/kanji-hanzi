# frozen_string_literal: true

require_relative "test_helper"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_renders_default_character
    get "/"

    assert last_response.ok?
    assert_includes last_response.body, 'alt="Japanese rendering of 返"'
  end

  def test_index_renders_requested_character
    get "/", character: "道"

    assert last_response.ok?
    assert_includes last_response.body, 'alt="Japanese rendering of 道"'
    assert_includes last_response.body, 'alt="Traditional Chinese rendering of 道"'
    assert_includes last_response.body, 'alt="Simplified Chinese rendering of 道"'
  end

  def test_index_uses_only_first_character_of_input
    get "/", character: "道具"

    assert last_response.ok?
    assert_includes last_response.body, 'alt="Japanese rendering of 道"'
    refute_includes last_response.body, "具"
  end

  def test_index_embeds_three_rendered_images
    get "/"

    assert last_response.ok?
    assert_equal 3, last_response.body.scan("data:image/png;base64,").size
  end
end
