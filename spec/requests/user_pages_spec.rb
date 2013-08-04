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
	    		let(:user) { User.find_by(email: "user@example.com") }

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
		before {
			sign_in user 
			visit edit_user_path(user) 
		}

		describe "page" do
			it { should have_content "Update your profile" }
			it { should have_title "Edit User"}
			it { should have_link 'change', href: 'http://gravatar.com/emails'}
		end

		describe "with invalid information" do
			before { click_button "Save changes"}

			it { should have_content 'error' }
		end

		describe "with valid information" do
			let(:new_name) { "new name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name", 		with: new_name
				fill_in "Email",		with: new_email
				fill_in "Password",		with: user.password
				fill_in "Confirm Password", with: user.password
				click_button "Save changes"
			end

			it { should have_title new_name }
			it { should have_selector 'div.alert.alert-success' }
			it { should have_link('Sign out', href: signout_path) }
			it { expect(user.reload.name).to eq new_name }
			it { expect(user.reload.email).to eq new_email }
		end
	end

	describe "profile_page" do
		let(:user2) { FactoryGirl.create(:user2) }
		before { visit user_path(user2) }

		it { should have_content(user2.name) }
		it { should have_title(user2.name) }
	end

	describe "index" do
		let(:user) {FactoryGirl.create(:user) }

		before do
			FactoryGirl.create(:user, name: 'Hans', email: 'hans@wurst.de')
  			FactoryGirl.create(:user, name: 'Wurst', email: 'wurst@hans.de')
			sign_in user
			visit users_path
		end

		it { should have_title 'All users' }
		it { should have_content 'All users'}

		it "should list each user" do
			User.all.each do |user|
				expect(page).to have_selector('li', text: user.name)
			end
		end

		describe "pagination" do
			before(:all) { 30.times { FactoryGirl.create(:user) } }
			after(:all) { User.delete_all }

			it { should have_selector 'div.pagination'}
			it "should list each user" do
				User.paginate(page: 1, per_page: 10).each do |user|
					expect(page).to have_selector 'li', text: user.name
				end
			end
		end
	end
end