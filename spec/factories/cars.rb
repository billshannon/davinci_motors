FactoryGirl.define do


#   factory :car do
#     make "MyString"
# model "MyString"
# year 1
# price "9.99"
#   end


  factory :car do
    model { Faker::Name.first_name }
    make { Faker::Name.last_name }
    year { Faker::Internet.email }
    price { Faker::Number }
  end
end
