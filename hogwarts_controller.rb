require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('./models/student.rb')

get('/students') do
  @students = Student.all()
  erb(:index)
end

get('/students/new') do
  erb(:new)
end

get('/students/:id') do
  id = params[:id]
  @student = Student.find(id)
  erb(:show)
end

post('/students') do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end
