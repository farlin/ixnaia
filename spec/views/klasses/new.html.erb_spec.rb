require 'rails_helper'

RSpec.describe "klasses/new", type: :view do
  before(:each) do
    assign(:klass, Klass.new(
      :name => "MyString",
      :teacher => nil,
      :student => nil
    ))
  end

  it "renders new klass form" do
    render

    assert_select "form[action=?][method=?]", klasses_path, "post" do

      assert_select "input#klass_name[name=?]", "klass[name]"

      assert_select "input#klass_teacher_id[name=?]", "klass[teacher_id]"

      assert_select "input#klass_student_id[name=?]", "klass[student_id]"
    end
  end
end
