require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }
  
  describe "attributes" do
    it "has a title attribute" do
      expect(question).to have_attributes(title: "New Question Title")
    end
  
    it "has a body attribute" do
      expect(question).to have_attributes(body: "New Question Body")
    end
  
    it "it should have a resolved attribute" do
      expect(question).to have_attributes(resolved: false)
    end
  end
end
