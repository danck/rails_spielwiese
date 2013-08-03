require 'spec_helper'

describe "UserPages" do
	subject { page }

  	describe "signup page" do
  		before { visit signup_path }

	    it { should have_content 'Sign Up'}
	    it { should have_title(full_title 'Sign Up') }

	    let(:submit) { "Create my account" }

	    describe "with invalid information" do
	    	it "should not create a user" do
	    		initial = User.count
	    		click_button submit
	    		final = User.count
	    		expect(initial).to eq final
	    	end
	    	describe "after submission" do
	    		#before { click_button submit }
		    	it { click_button submit; should have_content "error" }
	    	end
	    end

	    describe "with valid information" do
	    	before do
	    		fill_in "Name",			with: "Example User"
	    		fill_in "Email",		with: "user@example.com"
	    		fill_in "Password",		with: "foobar"
	    		fill_in "Confirmation",	with: "foobar"
	    	end

	    	# alternative Formulierung zu it-Block in "with valid..."
	    	it "should create user" do
	    		expect { click_button submit }.to change(User, :count).by(1)
	    	end
	    end
	end

	describe "profile_page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end
end