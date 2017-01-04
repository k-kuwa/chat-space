FactoryGirl.define do

  factory :message do
    body              {Faker::Lorem.paragraph(sentence_count = 3)}
    image             {Faker::Avatar.image("my-own-slug")}
    created_at        "0000-00-00 00:00:00"
    updated_at        "0000-00-00 00:00:00"
  end

end
