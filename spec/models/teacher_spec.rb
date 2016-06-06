#
require 'rails_helper'

RSpec.describe Teacher, type: :model do
    
    it "is invalid without a name" do
        
        res = Teacher.new(name: nil)
        res.valid?
        expect(res.errors[:name]).to include("can't be blank")
    end

end