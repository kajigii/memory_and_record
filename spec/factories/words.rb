FactoryBot.define do
  factory :word do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |word|
      word.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end