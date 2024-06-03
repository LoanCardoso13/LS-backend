# rubocop:disable all
ENV["RACK_ENV"] = "test"

require "fileutils"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CMSTest < Minitest::Test

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
    create_document "about.md", File.read('./data/about.md')
    create_document "changes.txt", File.read('./data/changes.txt')
    create_document "history.txt", File.read('./data/history.txt')
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { signin: true } }
  end

  def test_index
    pattern = File.join(data_path, '*')
    list = Dir.glob(pattern).map { |item| File.basename(item) }

    get "/"
    assert_equal 200, last_response.status
    list.each do |filename|
      assert_includes(last_response.body, filename)
    end
  end

  def test_content
    file_path = File.join(data_path, 'history.txt')
    content = File.read(file_path)

    get "/history.txt/view"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_equal content, last_response.body
  end

  def test_document_not_found
    wrong_name = 'somefile.ext'

    get "/#{wrong_name}/view"

    assert_equal 302, last_response.status
    assert_equal 'somefile.ext does not exist.', session[:message]
    get "/"
    refute_equal 'somefile.ext does not exist.', session[:message]
  end

  def test_rendering_markdown
    get "/about.md"

    refute_includes last_response.body, '#'
  end

  def test_editing_text
    create_document 'dummy.txt', 'initial text'
    file_path = File.join(data_path, 'dummy.txt')

    assert_equal 'initial text', File.read(file_path)

    post "/dummy.txt/edit", {:changes => 'final text'}, admin_session
    assert_equal 302, last_response.status

    assert_equal "dummy.txt has been updated.", session[:message]
    get last_response["Location"]
    refute_equal "dummy.txt has been updated.", session[:message]

    assert_equal 'final text', File.read(file_path)

    File.delete(file_path)
  end

  def test_adding_file
    get "/new"
    assert_equal 200, last_response.status

    post "/new_file", {filename: "new_file.txt"}, admin_session
    assert_equal 302, last_response.status

    get last_response["Location"]

    assert_equal 200, last_response.status
    assert_includes last_response.body, "new_file.txt"
    assert_includes last_response.body, %q(<a href="/new">New Document</a>)
  end

  def test_empty_filename
    post "/new_file", {filename: ""}, admin_session
    assert_equal 302, last_response.status

    assert_equal "A name is required.", session[:message]
    get last_response["Location"]
    refute_equal "A name is required.", session[:message]
  end

  def test_delete_file
    create_document 'a_file.txt'

    get "/"
    assert_includes last_response.body, 'a_file.txt'

    post '/a_file.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    
    assert_equal 'a_file.txt has been deleted.', session[:message]
    get last_response["Location"]
    refute_equal 'a_file.txt has been deleted.', session[:message]

    get "/"

    refute_includes last_response.body, 'a_file.txt'
  end

  def test_signin
    get "/", {}, admin_session
    assert_equal 200, last_response.status

    assert_includes last_response.body, 'Sign Out'

    post "/signout"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, 'Sign In'
  end

  def test_wrong_credentials
    post "/signout"

    post "/signin", user: "nobody", password: "no"
    assert_equal 302, last_response.status
    assert_equal 'Invalid Credentials', session[:message]
  end

end
