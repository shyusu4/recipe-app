# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Zach', email: 'imzackzz@gmail.com', password: '1234567', password_confirmation: '1234567', role: 'admin')
second_user = User.create(name: 'Chris', email: 'mgemmons@gmail.com', password: '1234567', password_confirmation: '1234567', role: 'user')
third_user = User.create(name: 'Amy', email: 'microfab@hotmail.com', password: '1234567', password_confirmation: '1234567', role: 'user')
fourth_user = User.create(name: 'Mariam', email: 'andrewik@comcast.net', password: '1234567', password_confirmation: '1234567', role: 'user')