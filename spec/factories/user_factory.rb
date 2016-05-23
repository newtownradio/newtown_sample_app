FactoryGirl.define do 
	factory :user do 
		email 
		password 
		first_name 
		last_name 
		admin false

	end
end

factory :admin, class: User do
  email 
  password 
  admin true
  first_name 
  last_name 
end