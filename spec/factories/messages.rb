FactoryGirl.define do

  factory :message do
    body              "Hello world!"
    image             "hoge.png"
    user_id 1
    group_id 1
  end

end
