ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def setup
    root = File.expand_path("../../data", __FILE__)
    content1 = File.read(root + '/about.md')
    content2 = File.read(root + '/changes.txt')
    content3 = File.read(root + '/history.txt')
    FileUtils.mkdir_p(data_path)
    create_document "about.md", content1
    create_document "changes.txt", content2
    create_document "history.txt", content3
  end

  def teardown
    FileUtils.rm_rf(data_path)
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
    get "/history.txt/edit"    
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"

    post "/history.txt/edit", content: "Added content for testing."
    assert_equal 302, last_response.status

    redirection = last_response["location"]
    get redirection
    assert_equal 200, last_response.status
    assert_includes last_response.body, "history.txt has been updated."

    get redirection
    assert_equal 200, last_response.status
    refute_includes last_response.body, "history.txt has been updated."

    get "/history.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "Added content for testing." 
  end

  def test_create
    get "/new"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<button" 

    post "/new", add: 'dummy.txt'
    assert_equal 302, last_response.status

    get last_response["location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "dummy.txt" 
    assert_includes last_response.body, "dummy.txt was created" 

    post "/new", add: '   '
    assert_includes last_response.body, "A name is required." 
  end

  def test_delete
    get "/"
    assert_equal 200, last_response.status
    assert_includes last_response.body, ">Delete<"
    assert_includes last_response.body, "history.txt"
    assert_includes last_response.body, "about.md"

    post "/history.txt/delete"
    assert_equal 302, last_response.status

    redirection = last_response["location"]
    get redirection
    assert_equal 200, last_response.status
    assert_includes last_response.body, "history.txt has been deleted."
    assert_includes last_response.body, "about.md"

    get redirection
    assert_equal 200, last_response.status
    refute_includes last_response.body, "history.txt has been deleted."
    assert_includes last_response.body, "about.md"
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, "Welcome"
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    post "/users/signin", username: "admin", password: "secret"
    get last_response["Location"]
    assert_includes last_response.body, "Welcome"

    post "/users/signout"
    get last_response["Location"]

    assert_includes last_response.body, "You have been signed out"
    assert_includes last_response.body, "Sign In"
  end

end
