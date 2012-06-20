require 'spec_helper'

describe Post, "creating post" do

  before(:each) do
    @post = Post.new(email: 'user@xyz.com', body:'some text')
  end

  subject { @post }

  it { should respond_to(:body) }
  it { should respond_to(:email) }

  describe "with valid email and non-empty body" do
    it { should be_valid }
  end

  describe "with valid email, but empty body" do
    before { @post.body = "" }
    it { should be_valid }
  end

  describe "without email and non-empty body" do
    before { @post.email = "" }
    it { should_not be_valid }
  end


  describe "without email and empty body" do
    before do
      @post.body = ""
      @post.email = ""
    end
    it {should_not be_valid}
  end

end
