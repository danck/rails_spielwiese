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

	    	describe "after saving a user" do
	    		before { click_button submit }
	    		let(:user) { User.find_by(email: 'user@example.com') }

	    		it { should have_link 'Sign out'}
	    		it { should have_title user.name }
	    		it { should have_selector 'div.alert.alert-success', text: 'Welcome'}

	    		describe "and signing out again" do
		    		before { click_link "Sign out" }
		    		it { should have_link "Sign in"}
	    		end
	    	end
	    end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit edit_user_path(user) }

		describe "page" do
			it { should have_content "Update your profile" }
			it { should have_title "Edit User"}
			it { should have_link 'change', href: 'http://gravatar.com/emails'}
		end

		describe "with invalid information" do
			before { click_button "Save changes"}

			it { should have_content 'error' }
		end
	end

	describe "profile_page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end
end