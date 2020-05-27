require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination', count: 1 
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    # https://qiita.com/bitcoinjpnnet/items/07ba89a6d329bd2893e5#%E6%BC%94%E7%BF%92-6
    end
  end
end