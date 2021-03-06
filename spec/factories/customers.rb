# frozen_string_literal: true

FactoryGirl.define do
  factory :customer do
    first_name { Faker::Name.name }
    career { Faker::Job.title }
    address { Faker::Address.street_name }
    birthday { 1991 }
    phone_number { Faker::PhoneNumber.phone_number }
    gender { %w[Nam Nữ].sample }

    association :store
  end
end
