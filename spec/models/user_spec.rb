require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should have_many :crawls }
  it { should have_many :reports }
  it { should have_many :completed_crawls }
  it { should have_many(:received_messages).class_name('Message').with_foreign_key("to_id") }
  it { should have_many(:sent_messages).class_name('Message').with_foreign_key("from_id") }


  describe "full_size_pic" do
    before do
      @user = create :user
    end
    it "takes a photo url from Google+ and slices off the end to make it full-sized" do
      @user.photo_url = "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50"
      @user.full_size_pic.should eq "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg"
    end
    it "does not alter other photo urls" do
      @user.photo_url = "www.example.com/photo.jpg"
      @user.full_size_pic.should eq "www.example.com/photo.jpg"
    end
  end
end
