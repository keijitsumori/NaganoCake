# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理アカウントの作成
Admin.create!(
    email: "a@ab",
    password: "aaaaaa"
)

Genre.create!(
    name: "ケーキ"
)

Genre.create!(
    name: "プリン"
)

Item.create!(
    image: File.open("./app/assets/images/cake_image1.jpeg"),
    name: "洋梨のケーキ",
    introduction: "洋梨のケーキです",
    genre_id: 1,
    price: 800,
    is_active: true
)

Item.create!(
    image: File.open("./app/assets/images/cake_image2.jpeg"),
    name: "ショートケーキ",
    introduction: "ショートケーキです",
    genre_id: 1,
    price: 700,
    is_active: true
)