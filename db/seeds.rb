# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Pitch.destroy_all

# 10.times do
#   Pitch.create(name: Faker::App.name, description: Faker::Lorem.paragraph, student_id: 1, round_id: 1)
# end
# 10.times do
#   Pitch.create(name: Faker::App.name, description: Faker::Lorem.paragraph, student_id: 2, round_id: 1)
# end

Admin.destroy_all
Cohort.destroy_all
Student.destroy_all
Pitch.destroy_all

a=Admin.create(
  :first_name => "Uber",
  :last_name => "Admin",
  :email => "admin@hello.com",
  :password => "password"
  )
if a.errors.any?
  puts "Errors for Admin create"
  a.errors.each {|e| p e}
else
  puts a.inspect
end

cb=Cohort.create(name: "Bumblebee", active: "true", pitch_limit: 2, pitch_start: "2017-05-10", vote_start: "2017-05-11", vote_limit: 3, vote_end: "2017-05-12", stage_id:0)
if cb.errors.any?
  puts "cb errors"
  cb.errors.each {|e|p e}
else
  puts cb.inspect
end

cf=Cohort.create(name: "Fireball", active: "false", pitch_limit: 2, pitch_start: "2017-05-10", vote_start: "2017-05-11", vote_limit: 3, vote_end: "2017-05-12", stage_id:0)
if cf.errors.any?
  puts "cf errors"
  cf.errors.each {|e|p e}
else
  puts cf.inspect
end

cfx=Cohort.create(name: "Fox", active: "true", pitch_limit: 2, pitch_start: "2017-05-10", vote_start: "2017-05-11", vote_limit: 3, vote_end: "2017-05-12", stage_id:0)
if cfx.errors.any?
  puts "cfx errors"
  cfx.errors.each {|e|p e}
else
  puts cfx.inspect
end
puts
us=Student.create(
  :first_name => "Uber",
  :last_name => "Student",
  :email => "student@hello.com",
  :cohort => Cohort.last,
  :password => "password"
  )
if us.errors.any?
  puts "student create errors"
  us.errors.each {|e|p e}
else
  puts us.inspect
end
puts
students=[]
10.times do
  student = {
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :cohort => Cohort.first,
    :password => 'password'
  }
  s=Student.create(student)
  if s.errors.any?
   puts "student create errors"
   s.errors.each {|e|p e}
  else
    puts s.inspect
    students<<s
  end
end
puts "\n\n Adding pitches for Uber Student"
(2 + us.cohort.pitch_limit).times do
  puts "--------------------------------"
  p Pitch.all.count
  Pitch.all.each {|x| p x.inspect}
  p = Pitch.create(name: Faker::App.name, description: Faker::Lorem.paragraph, student_id: us.id, round_id: 0)
  if p.errors.any?
    puts "pitch create errors for #{p.inspect}"
    p.errors.full_messages.each {|e|p e}
  else
    puts "Pitch added #{p.inspect}"
  end
end

puts "\n\n Adding pitches for non-Uber Students"

20.times do
  puts "--------------------------------"
  p Pitch.all.count
  Pitch.all.each {|x| p x.inspect}
  p = Pitch.create(name: Faker::App.name, description: Faker::Lorem.paragraph, student_id: students[rand(0..9)].id, round_id: 1)
   if p.errors.any?
    puts "pitch create errors #{p.inspect}"
    p.errors.full_messages.each {|e|p e}
    p.cohort.errors.full_messages.each {|e|p e}
    # p.errors.delete
  else
    puts "Pitch added #{p.inspect}"
  end
end

