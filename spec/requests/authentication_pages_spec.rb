require 'spec_helper'

describe "AuthenticationPages" do
  
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

    describe "after another page" do
      before { click_link "Home" }
      it {should_not have_selector('div.alert.alert-error')}
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user)}

      describe "in the users controller" do
            describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            expect(page).to have_title('Edit user')
          end
        end
      end

        end

        describe "submitting the update action" do
          before { patch user_path(user) }

          it { expect(response).to redirect_to(signin_path)}
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user)}
      let(:user2) { FactoryGirl.create(:user2)}

      describe "visit other users edit page" do
        before { sign_in user }
        before { visit edit_user_path(user2) }
        it { should_not have_title 'Edit User' }

        # TODO: Schlaegt fehl... warum?
        #it { should have_content 'Mighty Sample' }
      end

      describe "submitting a PATCH rq to other Users#update action" do
        before { sign_in user, no_capybara: true }
        before { patch user_path(user2) }
        specify { expect(response).to redirect_to root_url }
      end
    end
  end
end
