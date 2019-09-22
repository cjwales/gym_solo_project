require_relative('../db/sql_runner.rb')
require_relative('./member.rb')
require_relative('./gym_class.rb')

class Booking

  attr_reader :id
  attr_accessor :member_id, :class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @class_id = options['class_id'].to_i()
  end

  def save()
    sql = "INSERT INTO bookings (member_id, class_id) VALUES ($1, $2) RETURNING id"
    values = [@member_id, @class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first())
  end

  def gym_class()
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [@class_id]
    results = SqlRunner.run(sql, values)
    return GymClass.new(results.first())
  end

  def get_class_size()
    sql = "SELECT COUNT(class_id) FROM bookings WHERE class_id = $1"
    values = [@class_id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def self.members(id)
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id WHERE class_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results.map { |booking| Booking.new(booking) }
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find_all(id)
    sql = "SELECT * FROM bookings WHERE class_id = $1"
    values = [id]
    bookings = SqlRunner.run(sql, values)
    results = bookings.map { |booking| Booking.new(booking) }
    return results
  end

end
