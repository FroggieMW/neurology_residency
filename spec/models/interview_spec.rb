require 'rails_helper'

RSpec.describe Interview, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:residency_program) }

    it { should belong_to(:interviewee) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
