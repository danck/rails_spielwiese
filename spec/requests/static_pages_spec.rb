require 'spec_helper'

describe "Static Pages" do
	describe "Home page" do
	 	it "should have the content 'Mighty Sample'" do
	    	visit '/static_pages/home'
	    	expect(page).to have_content('Mighty Sample')
		end

		it "should have the correct title" do
			visit '/static_pages/home'
			expect(page).to have_title("Fruchtfabrik | Home")
		end
	end

	describe "Help Page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "should have the correct title" do
			visit '/static_pages/help'
			expect(page).to have_title("Fruchtfabrik | Help")
		end
	end

	describe "About Page" do
		it "should have the content 'About us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "should have the correct title" do
			visit '/static_pages/about'
			expect(page).to have_title("Fruchtfabrik | About")
		end
	end
end