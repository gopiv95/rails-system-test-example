require "application_system_test_case"
require "socket"

class PostsTest < ApplicationSystemTestCase
  driven_by :docker_chrome

  def setup
    host! "http://#{IPSocket.getaddress(Socket.gethostname)}"
  end

  1000.times do |i|
    test "visiting the index #{i}" do
      visit posts_url

      Post.create!

      assert_selector "h1", text: "Post"

      visit posts_url
    end
  end
end
