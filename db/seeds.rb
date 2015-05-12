# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def sample_file(filename)
  File.new("test/fixtures/#{filename}")
end


Mentor.create(
  name: 'Vladamir',
  email: 'vlad@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/vladamir_putin.jpg"),
  city: 'Moscow',
  country: 'Russia',
  official_ranking: 1600,
  price: 10,
  user_ranking: 3.5

)
Mentor.create(
  name: 'BobbyD',
  email: 'dylan@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/bob_dylan.jpg"),
  city: 'New York City',
  country: 'USA',
  price: 10,
  official_ranking: 1500,
  user_ranking: 5.0
)
Mentor.create(
  name: 'BobbyF',
  email: 'fischer@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/bobby.jpeg"),
  city: 'Unknown',
  country: 'Phillipines',
  price: 10,
  official_ranking: 2600,
  user_ranking: 1.0
)
Mentor.create(
  name: 'Arnold',
  email: 'arnold@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/arnold.jpeg"),
  city: 'Los Angeles',
  country: 'USA',
  price: 10,
  official_ranking: 1300,
  user_ranking: 3.0
)
Mentor.create(
  name: 'GarryK',
  email: 'kasparov@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/garry_kasparov.jpg"),
  city: 'Paris',
  country: 'France',
  price: 10,
  official_ranking: 2800,
  user_ranking: 4.0
)
Mentor.create(
  name: 'Magneto',
  email: 'magneto@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/magneto.jpg"),
  city: 'Buenos Aires',
  country: 'Argentina',
  price: 10,
  official_ranking: 2700,
  user_ranking: 2.0
)
Mentor.create(
  name: 'OldMan',
  email: 'oldman@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/old_man.jpg"),
  city: 'New Haven',
  country: 'USA',
  price: 10,
  official_ranking: 2600,
  user_ranking: 5.0
)
Mentor.create(
  name: 'JuditP',
  email: 'judit@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/judit_polgar.jpg"),
  city: 'Budapest',
  country: 'Hungary',
  price: 10,
  official_ranking: 2800,
  user_ranking: 4.5
)
Mentor.create(
  name: 'MagnusC',
  email: 'magnus@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/magnus_carlson.jpg"),
  city: 'Oslo',
  country: 'Norway',
  price: 10,
  official_ranking: 2900,
  user_ranking: 3.5
  )
Mentor.create(
  name: 'PStewart',
  email: 'stewart@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  avatar: sample_file("assets/patrick_stewart.jpg"),
  city: 'Hollywood',
  country: 'USA',
  price: 10,
  official_ranking: 2300,
  user_ranking: 4.5
)
