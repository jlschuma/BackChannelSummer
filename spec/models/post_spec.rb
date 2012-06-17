require 'spec_helper'

describe Post do

  before { @post = Post.new }

  subject { @post }

  describe "creating a post" do

    describe "when email is not present " do
      before { @post.email = "" }
      it {should_not be_valid}
    end

    describe "with empty body" do
      before { @post.body = "" }
      it {should_not be_valid}
    end

    describe "with non-empty body" do
      before { @post.body = "some text" }
      it {should be_valid}
    end

  end
end
