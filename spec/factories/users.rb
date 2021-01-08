FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { gimei }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { gimei.first.kanji }
    last_name { gimei.last.kanji }
    first_name_ruby { gimei.first.katakana }
    last_name_ruby { gimei.last.katakana }
    birthday { Faker::Date.birthday }
  end
end
