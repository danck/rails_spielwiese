require 'spec_helper'
require './spec/requests/shared_static_pages.rb'

describe "Static Pages" do
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content 'Mighty Sample' }
		it { should have_title full_title '' } # utiliy methode aus support/utilities.rb

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

		it { should have_content 'Contact' }
		it { should have_title "#{@site_title_prefix}Contact" }
	end
end