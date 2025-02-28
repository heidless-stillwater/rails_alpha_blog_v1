namespace :logins do
  desc "seed admin"
  task seed_admin: :environment do
    User.destroy_all

    # admin username
    username = "arjuna"
    email = "rob.lockhart@yahoo.co.uk"
    password = "password"

    user = User.create!(
                  username: username,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  admin: true
                )

    5.times do |i|
      Article.create(title: "#{Faker::Lorem.word}_#{i}", description: "#{Faker::Lorem.paragraph}_#{i}", user_id: user.id)
    end
  end

  desc "seed users"
  task seed_users: :environment do
    5.times do |i|
      password = "password"
      user = User.create!(
                    username: "user_#{i}",
                    email: "email_#{i}@test.com",
                    password: password,
                    password_confirmation: password,
                    admin: false
                  )

      5.times do |i|
        Article.create(title: "#{Faker::Lorem.word}_#{i}", description: "#{Faker::Lorem.paragraph}_#{i}", user_id: user.id)
      end

      # 3.times do
      #   Article.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, user_id: user.id)
      # end
    end
  end
end
