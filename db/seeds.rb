# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
CSV.foreach(Rails.root.join('csfile.csv'), headers: true) do |row|
  
  user = User.create({
    role: row[0],
    email: row[1],
    first_name: row[2],
    last_name: row[3],
    password_digest: row[4],
    is_active: row[5],
    picture_url: row[6],
    phone: row[7],
    created_at: row[8],
    updated_at: row[9]
  })
  
end


super_user = User.create(
  first_name: "Donald",
  last_name: "Duck",
  email: "a@a.a",
  password: "a",
  phone: "44444444444444444",
  role: 2,
  is_active: true
)
teacher = User.create(
  first_name: "Smack",
  last_name: "Daddy",
  email: "b@b.b",
  password: "b",
  phone: "44444444444444444",
  role: 1,
  is_active: true

)
student = User.create(
  first_name: "Mickey",
  last_name: "Mouse",
  email: "c@c.c",
  password: "c",
  phone: "44444444444444444",
  role: 0,
  is_active: true

)
User.create(
  first_name: "James",
  last_name: "John",
  email: "d@d.d",
  password: "d",
  phone: "44444444444444444",
  role: 0,
  is_active: true
)
User.create(
  first_name: "Ricky",
  last_name: "Jones",
  email: "e@e.e",
  password: "e",
  phone: "44444444444444444",
  role: 0,
  is_active: true
)

User.create(
  first_name: "Asta",
  last_name: "Marto",
  email: "f@f.f",
  password: "f",
  phone: "44444444444444444",
  role: 0,
  is_active: true
)

User.create(
  first_name: "Bob",
  last_name: "Gregoroston",
  email: "g@g.g",
  password: "g",
  phone: "44444444444444444",
  role: 0,
  is_active: true
)
Cohort.create(
  title: "Cohort 34",
  program: "Web Development Bootcamp",
  status: 2,
)
Cohort.create(
  title: "Cohort 35",
  program: "Web Development Bootcamp",
  status: 2,
)




p(User.all.count);
p(Cohort.all.count);
