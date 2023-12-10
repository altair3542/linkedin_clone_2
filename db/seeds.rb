# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Users
require 'set'

# Users
100.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6),
  )
end

# Companies
100.times do
  Company.create(
    name: Faker::Company.name,
  )
end

# Jobs
unique_numbers = Set.new

100.times do
  unique_number = rand(1..9)

  # Garantizar unicidad
  while unique_numbers.include?(unique_number)
    unique_number = rand(1..9)
  end

  unique_numbers.add(unique_number)

  Job.create(
    title: Faker::Job.title,
    description: Faker::Job.field,
    company_id: unique_number,
  )
end

# Conversations
50.times do |x|
  Conversation.create(
    sender_id: x + 1,            # Asegúrate de que los IDs de usuario comiencen desde 1
    recipient_id: x + 6,         # Asegúrate de que los IDs de usuario comiencen desde 1
  )
end

# Messages
50.times do |x|
  Message.create(
    body: Faker::Lorem.paragraph,
    read: Faker::Boolean.boolean,
    user_id: x + 1,              # Asegúrate de que los IDs de usuario comiencen desde 1
    conversation_id: x + 6,      # Asegúrate de que los IDs de usuario comiencen desde 1
  )
end

