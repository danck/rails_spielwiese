FactoryGirl.define do
	factory :user do
		name	"Manfred Wurst"
		email	"wurst@manfred.com"
		password "temp4U!"
		password_confirmation "temp4U!"
	end

	factory :user2, class: :user do
		name	"Manfred Wurst2"
		email	"wurst2@manfred.com"
		password "temp4U!2"
		password_confirmation "temp4U!2"
	end
end