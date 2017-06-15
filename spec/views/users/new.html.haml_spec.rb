require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :spire => "MyString",
      :active => false,
      :admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[phone]"

      assert_select "input[name=?]", "user[spire]"

      assert_select "input[name=?]", "user[active]"

      assert_select "input[name=?]", "user[admin]"
    end
  end
end
