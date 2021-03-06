require 'spec_helper'
require './spec/requests/shared_static_pages.rb'

describe "Static Pages" do
	subject { page }

	it "SHould have the right links in the root Layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About'))
		click_link "Help"
		expect(page).to have_title(full_title('Help'))
	end

	describe "Home page" do
		before { visit root_path }

		it { should have_title full_title '' } # utility methode aus support/utilities.rb

		describe "for signed in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipselei")
				FactoryGirl.create(:micropost, user: user, content: "Ipselum Leerum")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					expect(page).to have_content(item.content)
				end
			end

			it { should have_content user.microposts.count.to_s + " posts" }
		end
	end

	describe "Help Page" do
		before { visit help_path }

		it { should have_content 'Help' }
		it { should have_title "#{@site_title_prefix}Help" }
	end

	describe "About Page" do
		before { visit about_path }

		it { should have_content 'About' }
		it { should have_title "#{@site_title_prefix}About" }
	end

		describe "Contact Page" do
		before { visit contact_path }

		it { should have_selector 'h1', text: 'Contact' }
		it { should have_title "#{@site_title_prefix}Contact" }
	end
end