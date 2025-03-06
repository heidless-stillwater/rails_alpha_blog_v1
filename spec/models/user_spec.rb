require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:subject) {
    described_class.new(username: "user", email: "test@test.com", password: "password")
  }

  describe "Validations" do 

    it "User is valid with valid attributes" do 
      expect(subject).to be_valid 
    end

    it "User cannot have blank username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "User cannot have blank email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "User cannot have blank password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do 
    # user = User.new(username: "user", email: "test@test.com", password: "password")

    let(:first_article) { Article.new(title: "first article", description: "first description") }
    let(:second_article) { Article.new(title: "second article", description: "second description") }

    it "has many Articles" do
      # pending "add some examples to (or delete) #{__FILE__}"
      subject.articles << [first_article, second_article]
      expect(subject.articles).to eq([first_article, second_article])
   end
  end

end


# RSpec.describe User, type: :model do
#   subject {
#     described_class.new(password: "Anything",
#                         email: "Lorem ipsum"
#                       )
#   }

#   describe "Validations" do 

#     it "is valid with valid attributes" do 
#       expect(subject).to be_valid
#     end

#     it "is not valid without a password" do 
#       subject.password = nil
#       expect(subject).to be_invalid
#     end
  

#     it "is not valid without a email" do 
#       subject.email = nil
#       expect(subject).to be_invalid
#     end
  


#   end
# end
