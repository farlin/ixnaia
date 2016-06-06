#
require 'rails_helper'

RSpec.describe Klass, type: :model do
    
    it "is invalid without a teacher" do
        
        klz = Klass.new(teacher: nil)
        klz.valid?
        expect(klz.errors[:teacher]).to include("can't be blank")
    end
    
    it "is invalid without a name" do
        
        klz = Klass.new(name: nil)
        klz.valid?
        expect(klz.errors[:name]).to include("can't be blank")
    end

end