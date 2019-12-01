require 'rails_helper'

RSpec.describe ResidencyProgram, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:interviews) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
