require 'rails_helper'

RSpec.describe "klasses/index", type: :view do
  before(:each) do
    assign(:klasses, [
      Klass.create!(
        :name => "Name",
        :teacher => nil,
        :student => nil
      ),
      Klass.create!(
        :name => "Name",
        :teacher => nil,
        :student => nil
      )
    ])
  end

  it "renders a list of klasses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
