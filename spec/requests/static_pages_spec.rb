require 'spec_helper'

describe "Static Pages" do
	describe "Home page" do
	 	it "should have the content 'Mighty Sample'" do
	    	visit '/static_pages/home'
	    	expect(page).to have_content('Mighty Sample')
		end
	end

	describe "Help Page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
	end

	describe "About Page" do
		it "should have the content 'About us'" do
			visit '/static_pages/about_us'
			expect(page).to have_content('About Us')
		end
	end
end