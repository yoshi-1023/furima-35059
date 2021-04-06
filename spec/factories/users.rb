FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              { '1a' +Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {'阿部'}
    first_name            {'良和'}
    last_name_kana        {'アベ'}
    first_name_kana       {'ヨシカズ'}
    birth_day             {Faker::Date.in_date_period}
  end
end    