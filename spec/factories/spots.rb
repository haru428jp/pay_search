FactoryBot.define do
  factory :spot do
    name { Faker::Lorem.sentence }
    address { '東京都千代田区丸の内1-9-1' }
    latitude { 35.680244 }
    longitude { 139.760932 }
  end
end
