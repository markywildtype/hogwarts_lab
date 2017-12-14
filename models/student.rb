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

  def save()
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

  def delete()
    sql = 'DELETE FROM students WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM students;'
    students_hash_array = SqlRunner.run(sql)
    students = students_hash_array.map {|student| Student.new(student)}
    return students
  end

  def self.delete_all()
    sql = 'DELETE FROM students;'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = 'SELECT * FROM students WHERE id = $1'
    values = [id]
    found_student_hash = SqlRunner.run(sql, values)
    found_student = Student.new(found_student_hash[0])
    return found_student
  end

end
