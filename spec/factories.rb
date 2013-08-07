FactoryGirl.define do
	# factory :user do
	# 	name	"Manfred Wurst"
	# 	email	"wurst@manfred.com"
	# 	password "temp4U!"
	# 	password_confirmation "temp4U!"
	# end

	factory :user2, class: :user do
		name	"Manfred Wurst2"
		email	"wurst2@manfred.com"
		password "temp4U!2"
		password_confirmation "temp4U!2"
	end

	factory :user do
	    sequence(:name)  { |n| "Person #{n}" }
	    sequence(:email) { |n| "person_#{n}@example.com"}
	    password "foobar"
	    password_confirmation "foobar"

	    factory :admin do
	    	admin true
	    end
  	end

  	factory :micropost do
  		content "Lorem ipsum"
  		user
  	end
end