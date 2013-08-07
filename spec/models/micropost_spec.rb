require 'spec_helper'

describe Micropost do
	let(:user) { FactoryGirl.create(:user)}

  before do
  	@micropost = user.microposts.build( content: "Lorem Ipsum")
  end

  subject { @micropost }

  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should respond_to :user }
  its(:user) { should eq user}

  describe "when user is missing" do
  	before { @micropost.user = nil }
  	it { should_not be_valid }
  end

  describe "when content is missing" do
  	before { @micropost.content = nil }
  	it { should_not be_valid }
  end

  describe "when content is too long" do
  	before { @micropost.content = "a"*141 }
  	it { should_not be_valid }
  end
end