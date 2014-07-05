FactoryGirl.define do
	factory :user do
		email "example123@example.com"
		password "foobar123"
		password_confirmation "foobar123"
	end

	factory :hotel do
		title "Love hotel"
	end

  factory :hotel_with_grade do
    title "Love Hotel"
    grade { [FactoryGirl.create(:grade)] }
  end

  factory :grade do
    value 5
  end
end