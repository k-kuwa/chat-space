FactoryGirl.define do

  factory :group do
    name              { Faker::Name.name }
    id 1
    created_at        "0000-00-00 00:00:00"
  end

end
