require_relative('../db/sql_runner.rb')

class Booking

  attr_reader :id, :member_id, :class_id

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

end
