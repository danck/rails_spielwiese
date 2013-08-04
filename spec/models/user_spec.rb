require 'spec_helper'

describe User do

  before { @user = User.new(name: "Harald Test", email: "user@example.com",
  password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin)}

  it { should be_valid }
  it { should_not be_admin}

  describe "with admin attribute set to true" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "when password fields are not matching" do
    before do
      @user = User.new(name: "Hans Test", email: "valid@valid.com",
        password: "not", password_confirmation: "matching")
    end
    it { should be_invalid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Manfred Wurst", email: "valid@valid.com",
        password: " ", password_confirmation: " ")
    end
    it { should be_invalid }
  end

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

    it "should have only downcase after being reloaded from db" do
      @user.reload.email.should eq "capital@case.com"
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

  describe "when email is invalid" do
  	it "should be invalid" do
  		addresses = %w[bla@foo,com bla_at_foo.com bla@foo. foo@bl_a.com
  			foo@foo+bla.jp not@valid..com]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).to be_invalid
  		end
  	end
  end

  describe "return value of authentication method" do
    before { @user.save }
    let(:user_found) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq user_found.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_with_wrong_password) { user_found.authenticate("wrong paswd")}

      it { should_not eq user_with_wrong_password }
      it { expect(user_with_wrong_password).to be_false }
    end
  end

  describe "if password is too short" do
    before { @user.password = @user.password_confirmation = "a"*5 }
    it { should_not  be_valid }
  end

  describe "remember_token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end