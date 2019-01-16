require 'rails_helper'

RSpec.describe "actors/new", type: :view do
  before(:each) do
    assign(:actor, Actor.new(
      :name => "MyString",
      :icon_url => "MyString"
    ))
  end

  it "renders new actor form" do
    render

    assert_select "form[action=?][method=?]", actors_path, "post" do

      assert_select "input[name=?]", "actor[name]"

      assert_select "input[name=?]", "actor[icon_url]"
    end
  end
end
