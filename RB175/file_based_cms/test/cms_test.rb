ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end

  def test_content
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 2.0 released."
  end

  def test_not_found
    get "/ubauba.txt"
    assert_equal 302, last_response.status
    redirection = last_response["location"]

    get redirection
    assert_equal 200, last_response.status
    assert_includes last_response.body, "ubauba.txt does not exist."

    get redirection
    assert_equal 200, last_response.status
    refute_includes last_response.body, "ubauba.txt does not exist."
  end

  def test_render_markdown
    get "/about.md"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<h1>"
    refute_includes last_response.body, "#"
  end

  def test_edit
    
  end

end
