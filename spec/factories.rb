FactoryGirl.define do
	factory :user do
		name	"Manfred Wurst"
		email	"wurst@manfred.com"
		password "temp4U!"
		password_confirmation "temp4U!"
	end
end