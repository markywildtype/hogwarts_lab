require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :last_name, :house, :age
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save
    sql = 'INSERT INTO students (
    first_name,
    last_name,
    house,
    age)
    VALUES ($1, $2, $3, $4)
    RETURNING *;'
    values = [@first_name, @last_name, @house, @age]
    saved_student = SqlRunner.run(sql, values)
    @id = saved_student[0]['id'].to_i()
  end


end
