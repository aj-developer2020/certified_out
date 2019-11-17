# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

super_user = User.create(
  first_name: "Donald",
  last_name: "Duck",
  email: "a@a.a",
  password: "a",
  phone: "44444444444444444",
  role: 2
)
teacher = User.create(
  first_name: "Smack",
  last_name: "Daddy",
  email: "b@b.b",
  password: "b",
  phone: "44444444444444444",
  role: 1
)
student = User.create(
  first_name: "Mickey",
  last_name: "Mouse",
  email: "c@c.c",
  password: "c",
  phone: "44444444444444444",
  role: 0
)

Cohort.create(
  title: "Cohort 34",
  program: "Bootcamp",
  status: 2,
)



p(User.all.count);
p(Cohort.all.count);
