FactoryGirl.define do
	factory :user do
		email "myemail@here.com"
		password "mypassword"
		password_confirmation "mypassword"
	end

	factory :place do
		name "Awesome Brewery"
		description "Great Beer!"
		address "123 This St, Gloomy City"
	    latitude (42.3631519)
    	longitude (-71.056098)
    	#association :user
	end
end