require 'spec_helper'

describe User do

  before { @user = User.new(name: "Harald Test", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

  it { should be_valid }

  describe "when email already taken" do
  	before do
  		user_with_dublette_email = @user.dup
      user_with_dublette_email.attributes = { email: @user.email.upcase }
  		user_with_dublette_email.save
  	end

  	it { should be_invalid }
  end

  describe "when name ist not present" do
  	before { @user.update_attributes name: "" }

  	it { should be_invalid }
  end

  describe "when email address is not present" do
  	before { @user.update_attributes name: "Harald Test", email: " "}

  	it { should be_invalid }
  end

  describe "when user email is saved with upcase letters" do
    before do 
      @user.attributes = { email: "CAPITAL@CASE.COM" }
      @user.save
    end

    it "should have only downcase letters" do
      @user.email.should eq "capital@case.com"
    end
  end

  describe "when email address is valid" do
  	before { @user.update_attributes name: "Harald Test"}
  	it "should be valid" do
  		addresses = %w[bla@foo.com bla.foo@foo.to bla@bla.fu.com
  			bla+foo@bla.cn]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when email is nonsense" do
  	it "should be invalid" do
  		addresses = %w[bla@foo,com bla_at_foo.com bla@foo. foo@bl_a.com
  			foo@foo+bla.jp]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).to be_invalid
  		end
  	end
  end
end