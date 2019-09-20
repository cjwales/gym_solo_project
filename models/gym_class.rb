require_relative('../db/sql_runner.rb')

class GymClass

  attr_reader :id
  attr_accessor :name, :start_time, :max_capacity

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @start_time = options['start_time']
    @max_capacity = options['max_capacity'].to_i()
  end

  def save()
    sql = "INSERT INTO gym_classes (name, start_time, max_capacity) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @start_time, @max_capacity]
    gym_class = SqlRunner.run(sql, values).first()
    @id = gym_class['id'].to_i()
  end

  def update()
    sql = "UPDATE gym_classes SET (name, start_time, max_capacity) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @start_time, @max_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    gym_classes = SqlRunner.run(sql)
    result = gym_classes.map { |gym_class| GymClass.new(gym_class) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    gym_class = SqlRunner.run(sql, values)
    result = GymClass.new(gym_class.first())
    return result
  end

end
