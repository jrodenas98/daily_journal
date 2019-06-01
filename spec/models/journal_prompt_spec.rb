require 'rails_helper'

RSpec.describe JournalPrompt, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:user_entries) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
