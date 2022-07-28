# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'admin@admin',
    password: 'admin1',
)

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', introduction: 'よろしくおねがいします!', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image1.png"), filename:"image1.png")},
    {email: 'james@test.com', name: 'James', introduction: 'よろしくおねがいします!!', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image2.png"), filename:"image2.png")},
    {email: 'lucas@test.com', name: 'Lucas', introduction: 'よろしくおねがいします!!!', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/image3.png"), filename:"image3.png")}
  ]
)

posts = Post.create!(
  [
    {body: '雪だるま、上手にできたよ！！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo1.jpg"), filename:"logo1.jpg"), user_id: users[0].id },
    {body: 'たん生日にケーキを食べました。', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo2.jpg"), filename:"logo2.jpg"), user_id: users[1].id },
    {body: 'サッカーのし合をしました！', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo3.jpg"), filename:"logo3.jpg"), user_id: users[2].id }
  ]
)

PostComment.create!(
  [
    {comment: 'とても上手ですね！', user_id: users[0].id, post_id: posts[0].id },
    {comment: 'おいしそう！！', user_id: users[1].id , post_id: posts[1].id},
    {comment: 'かっこいい！', user_id: users[2].id , post_id: posts[2].id}
  ]
)


