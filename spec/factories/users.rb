require 'faker'

FactoryBot.define do
  factory :user do
    # Define your user attributes here (e.g., email, password)
    email { Faker::Internet.email }
    password { 'password123' } # You can change this to whatever password you want to use for testing
  end
end

