require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all
House.delete_all

house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "http://bit.ly/2Cl28L5"
  })

house2 = House.new({
  "name" => "Ravenclaw",
  "logo" => "http://bit.ly/2BlOlpT"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "logo" => "http://bit.ly/2ClhnUw"
  })

house4 = House.new({
  "name" => "Slytherin",
  "logo" => "http://bit.ly/2ysO7rr"
  })

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 11
  })

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 11
  })

student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house1.id,
  "age" => 12
  })

student4 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => house4.id,
  "age" => 12
  })

student5 = Student.new({
  "first_name" => "Cedric",
  "last_name" => "Diggory",
  "house_id" => house3.id,
  "age" => 13
  })


student1.save()
student2.save()
student3.save()
student4.save()
student5.save()


binding.pry
nil
# student1.delete()
