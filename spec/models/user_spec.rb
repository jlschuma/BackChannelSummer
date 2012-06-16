require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "user@example.com",
                     password: "somepassword",
                     password_confirmation: "somepassword",
                     isAdmin: false)
  end

  subject { @user }
  
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:isAdmin) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user.foo.com %@foo.net. foo@bar+baz.com]
      addresses.each do |invalid_addr|
        @user.email = invalid_addr
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com user@foo.COM 
                     A_Usr-b@f.b.org first.last@foo.jp a4b2@bar.ch]
      addresses.each do |valid_addr|
        @user.email = valid_addr
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken -identical" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end

  describe "when email address is already taken -case insensitive" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = "" }
    it { should_not be_valid }
  end

  describe "when confirmation password is not present" do
    before { @user.password_confirmation = "" }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it {should_not be_valid }
  end
end
