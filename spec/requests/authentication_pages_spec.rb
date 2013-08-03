require 'spec_helper'

describe "AuthenticationPages" do
<<<<<<< HEAD
  
  subject { page }

  describe "signin_page" do
  	before { visit signin_path }

  	it { should have_content "Sign in" }
  	it { should have_title "Sign in"}

  	describe "with invalid credentials" do
  		before { click_button "Sign in" }

  		it { should have_title "Sign in" }
  		it { should have_selector "div.alert.alert-error", text: 'Invalid' }
  	end

  	describe "with valid credentials" do
  		let(:user) { FactoryGirl.create :user }
  		before do
  			# Email upcase to test case insensitivity
  			fill_in "Email",	with: user.email.upcase
  			fill_in "Password",	with: user.password
  			click_button "Sign in"
  		end

  		it { should have_title user.name }
  		it { should have_link 'Profile',	href: user_path(user) }
  		it { should have_link 'Sign out',	href: signout_path }
  		it { should_not have_link 'Sign in',	href: signin_path}
  	end
=======
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentication_pages_index_path
      response.status.should be(200)
    end
>>>>>>> e569a2915389b8e35779c4c05b9d9a2a04fbafe4
  end
end
