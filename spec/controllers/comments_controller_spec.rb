require 'spec_helper'

describe CommentsController do

  before(:each) do
    @comment = Comment.new(email: 'testuser@test.com', body:'some text')
  end

  subject { @comment }

  it { should respond_to(:body) }
  it { should respond_to(:email) }

  describe "with valid email and non-empty body" do
    it { should be_valid }
  end

  describe "with valid email and empty body" do
    before { @comment.body = "" }
    it { should be_valid }
  end

  describe "without email and non-empty body" do
    before { @comment.email = "" }
    it { should be_valid }
  end


  describe "without email and empty body" do
    before do
      @comment.body = ""
      @comment.email = ""
    end
    it {should be_valid}
  end  



end
