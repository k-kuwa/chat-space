FactoryGirl.define do

  factory :user do
    name                  "kuwabara"
    email                 "kuwa@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
    id 1
    created_at            "0000-00-00 00:00:00"
  end

end
