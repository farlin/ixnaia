require 'rails_helper'

RSpec.describe "klasses/show", type: :view do
  before(:each) do
    @klass = assign(:klass, Klass.create!(
      :name => "Name",
      :teacher => nil,
      :student => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
