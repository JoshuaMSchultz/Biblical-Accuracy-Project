# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FastSeeder.seed_csv!(Book, "books.csv", :order_id, :name)
FastSeeder.seed_csv!(Chapter, "chapters.csv", :id, :book_id, :number_id)
FastSeeder.seed_csv!(Verse, "verses.csv", :book_id, :chapter_id, :order_id, :content)