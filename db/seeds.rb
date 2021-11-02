# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all

jkr = Author.create(first_name: "JK", last_name: "Rowling")
clarke = Author.create(first_name: "Arthur", last_name: "Clarke")

scifi = Genre.create(genre: "Sci-Fi")
fantasy = Genre.create(genre: "Fantasy")

harry = Book.create(title:"Harry Potter", author: jkr, status: "in_stock")
beasts = Book.create(title:"Fantastic Beasts", author: jkr)
space = Book.create(title: "2001", author: clarke)
fall = Book.create(title: "A Fall Of Moondust", author: clarke)

BookGenre.create(genre: scifi, book: fall)
BookGenre.create(genre: scifi, book: space)
BookGenre.create(genre: fantasy, book: harry)
BookGenre.create(genre: fantasy, book: beasts)