require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { User.create( :username => "jane", :email => "jane@doe.com", :password_digest => "pw1234", :admin => false ) }

  let(:subject) {
    described_class.new(title: "ffoo123456oo",
                        description: "bsar123456789",
                        user: user)
  }

  describe "Validations" do  
    it "Article is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "Article is not valid without title" do 
      subject.title = nil 
      expect(subject).to_not be_valid
    end

    it "Article is not valid without description" do       
      subject.description = nil 
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }  # allow nil user
  end
  
end
