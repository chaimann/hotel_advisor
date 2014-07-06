FactoryGirl.define do
	factory :user do
		email "example123@example.com"
		password "foobar123"
		password_confirmation "foobar123"
	end

	factory :hotel do
		title "Love hotel"
	end
end