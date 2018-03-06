# Create an admin account
user = User.find_or_initialize_by(email: 'admin@example.com')
user.name = 'administrator'
user.uin = Faker::Number.number(9)
user.email = "admin@example.com"
user.password = 'adminadmin'
user.admin = true
user.semester = 'Fall'
user.year =  2016.to_s #Faker::Number.between(2000 ,2026).to_s
user.course = 'CSCE606'
user.save!


user = User.find_or_initialize_by(email: 'admin@example.com')
user.name = 'administrator'
user.uin = Faker::Number.number(9)
user.email = "master@example.com"
user.password = 'adminadmin'
user.admin = true
user.semester = 'Spring'
user.year =  2015.to_s #Faker::Number.between(2000 ,2026).to_s
user.course = 'CSCE606'
user.save!


 100.times do |n|
   offset = rand(0..2)
   name = nil
   if(offset == 0) 
     name = Faker::StarWars.character
   elsif(offset==1)
     name = Faker::Superhero.name
   else
     name = Faker::Name.name
   end
     

   uin   = Faker::Number.number(9)
   email = "example-#{n+1}@railstutorial.org"
   password = "password"
   semester = n%3 == 0 ? "Spring" : "Fall"
   year = rand(2000..2026).to_s
   course = 'CSCE606'
   User.create!(name:  name,
                 uin: uin,
                 email: email,
                 semester: semester,
                 year: year,
                 course: course,
                 password:              password,
                 password_confirmation: password)
 end


#Adding non-legacy projects
 10.times do |n|
   title  = Faker::Company.catch_phrase
   organization = Faker::Company.name
   contact = Faker::Name.name + "  " + Faker::PhoneNumber.cell_phone
   description = Faker::Lorem.paragraph
   oncampus = n%3 == 0 ? false : true
   islegacy = n%4 == 0 ? false : true
   approved = false
   semester = n%3 == 0 ? 'Fall' : 'Spring'
   year =  rand(2000..2026).to_s
   Project.create!(title:  title,
                   organization: organization,
                   contact: contact,
                   description: description,
                   oncampus: oncampus,
                   islegacy: islegacy,
                   approved: approved,
                   semester: semester,
                   year: year)
 end




 10.times do |n|
   title  = Faker::Company.catch_phrase
   organization = Faker::Company.name
   contact = Faker::Name.name + "  " + Faker::PhoneNumber.cell_phone
   description = Faker::Lorem.paragraph
   oncampus = n%3 == 0 ? false : true
   islegacy = true
   approved = n%2==0 ? false : true
   legacy_id = rand(0..10)
   semester = n%3 == 0 ? 'Fall' : 'Spring'
   year =  rand(2015..2017).to_s
   Project.create!(title:  title,
                   organization: organization,
                   contact: contact,
                   description: description,
                   oncampus: oncampus,
                   islegacy: islegacy,
                   legacy_id: legacy_id,
                   approved: approved,
                   semester: semester,
                   year: year)
 end



 10.times do |n|
   title  = Faker::Company.catch_phrase
   organization = Faker::Company.name
   contact = Faker::Name.name + "  " + Faker::PhoneNumber.cell_phone
   description = Faker::Lorem.paragraph
   oncampus = n%3 == 0 ? false : true
   islegacy = true
   approved =  true
   legacy_id = rand(10..20)

   
   semester = n%3 == 0 ? 'Fall' : 'Spring'
   year =  rand(2015..2017).to_s
   Project.create!(title:  title,
                   organization: organization,
                   contact: contact,
                   description: description,
                   oncampus: oncampus,
                   islegacy: islegacy,
                   legacy_id: legacy_id,
                   approved: approved,
                   semester: semester,
                   year: year)
 end




 available_users = User.where(:admin => false).collect{|x| x.id}

teams = Hash.new
 12.times do |n|
   team_name = nil
   while true do
    team_name = Faker::Team.state.capitalize
    if !teams.key?(team_name)
      teams[team_name] = true
      break
    end
   end
   creator_id  = available_users.shuffle!.pop
   code = Faker::Number.number(4)
   
   t = Team.create!(name: team_name, user_id: creator_id, code: code)
   Relationship.create!(user_id: creator_id, team_id: t.id)

   rand(3..5).times do |x|
     member_id = available_users.shuffle!.pop
        Relationship.create!(user_id: member_id , team_id: t.id)
   end
 end
