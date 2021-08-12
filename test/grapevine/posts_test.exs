defmodule Grapevine.PostsTest do
  use Grapevine.DataCase
  import Grapevine.AccountsFixtures
  alias Grapevine.Post
  alias Grapevine.Posts

  describe "create/2" do
    test "successfully creates a new post" do
      %{id: id} = user_fixture()

      assert {
               :ok,
               %Post{
                 content: "http://google.com",
                 title: "my first post",
                 user_id: ^id
               }
             } = Posts.create(%{"title" => "my first post", "content" => "http://google.com"}, id)
    end
  end

  test "get all posts" do
    %{id: id} = user_fixture()

    {:ok, post_one} =
      Posts.create(
        %{"title" => "my first post", "content" => "https://google.com", "user_id" => id},
        id
      )

    {:ok, post_two} =
      Posts.create(
        %{"title" => "the second one", "content" => "https://wikipedia.org", "user_id" => id},
        id
      )

    test_posts = [post_one, post_two]
    assert test_posts == Posts.show_all()
  end
end
