require_relative('../db/sql_runner.rb')

class House

  attr_reader :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = 'INSERT INTO houses (name, logo)
    VALUES ($1, $2)
    RETURNING *;'
    values = [@name, @logo]
    saved_house = SqlRunner.run(sql, values)
    @id = saved_house[0]['id'].to_i
  end

  def self.all
    sql = 'SELECT * FROM houses;'
    houses_hash_array = SqlRunner.run(sql)
    houses = houses_hash_array.map {|house| House.new(house)}
    return houses
  end

  def self.delete_all
    sql = 'DELETE FROM houses;'
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = 'SELECT * FROM houses WHERE id = $1'
    values = [id]
    found_houses_array = SqlRunner.run(sql, values)
    found_house = House.new(found_houses_array[0])
    return found_house
  end

end
