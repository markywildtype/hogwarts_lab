require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('./models/student.rb')

get('/students') do
  @students = Student.all()
  erb(:index)
end
