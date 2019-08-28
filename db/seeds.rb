require 'faker'

newUser = User.create(email: 'denorrostallworth@gmail.com', password: 'abcd1234', password_confirmation: 'abcd1234', firstName: 'Denorro', lastName: 'Stallworth')

100.times do |post|
  Post.create!(date: Faker::Time.between(from: DateTime.now - 300, to: DateTime.now, format: :long), rationale: Faker::ProgrammingLanguage.name, user_id: newUser.id)
end

puts 'Test Posts have been created'