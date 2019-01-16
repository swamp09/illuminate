require 'rails_helper'

RSpec.describe "actors/index", type: :view do
  before(:each) do
    assign(:actors, [
      Actor.create!(
        :name => "Name",
        :icon_url => "Icon Url"
      ),
      Actor.create!(
        :name => "Name",
        :icon_url => "Icon Url"
      )
    ])
  end

  it "renders a list of actors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Icon Url".to_s, :count => 2
  end
end
