namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(fname: "Jaime",lname: "Jazareno",
                         email: "jaimejazareno1996@gmail.com",username: "jaimejaime",
                         password: "hahaha",
                         password_confirmation: "hahaha",
                         admin: true)
    99.times do |n|
      fname  = "First Name #{n}"
      lname  = Faker::Name.name
      username = "dummy#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(fname: fname,lname: lname,email: email,username:username,password: password,password_confirmation: password)
    end
 
  end
end
