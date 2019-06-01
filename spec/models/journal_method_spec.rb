require 'rails_helper'

RSpec.describe JournalMethod, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:journal_prompts) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
