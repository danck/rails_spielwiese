require 'spec_helper'

describe Relationship do
	let(:follower) { FactoryGirl.create(:user) }
	let(:followed) { FactoryGirl.create(:user) }

	before do
		@relationship = follower.relationships.build(followed_id: followed.id)
		# @relationship = follower.relationships.first
	end

	subject { @relationship }

	it { should be_valid }

	describe "when follower id is not present" do
		before { @relationship.follower_id = nil }
		it { should_not be_valid }
	end

	describe "when followed id is not present" do
		before { @relationship.followed_id = nil }
		it { should_not be_valid }
	end


	describe "follower methods" do

		subject { follower.relationships.first }

		it { should respond_to(:follower) }
		it { should respond_to(:followed) }
		its(:follower) { should eq follower}
		its(:followed) { should eq followed}
	end

	describe "should be deleted after destroying an associated user" do
		let(:del_follower_id) { follower.id }

		before do
			follower.relationships.first.save
			follower.destroy!
		end

		specify "followed doesn't know the deleted follower anymore" do
			expect(Relationship.where(follower_id: del_follower_id)).to eq []
		end
	end
end
