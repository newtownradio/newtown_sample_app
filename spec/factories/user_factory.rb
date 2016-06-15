FactoryGirl.define do 
	sequence(:email) { |n| "user#{n}@example.com" }
	factory :user do 
		email 
		password "testpassword"
		first_name "test"
		last_name "user"
		admin false
	end
end

factory :admin, class: User do
  email "colin_ilgen@icloud.com"
  password "gemcore1981"
  admin true
  first_name "colin"
  last_name "ilgen"
end
