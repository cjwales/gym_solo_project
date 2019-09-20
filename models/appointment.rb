require_relative('../db/sql_runner.rb')

class Appointment

  attr_reader :id, :member_id, :class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i()
    @class_id = options['class_id'].to_i()
  end

  def save()
    sql = "INSERT INTO appointments (member_id, class_id) VALUES ($1, $2) RETURNING id"
    values = [@member_id, @class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM appointments"
    results = SqlRunner.run(sql)
    return results.map { |appointment| Appointment.new(appointment) }
  end

  def self.delete_all()
    sql = "DELETE FROM appointments"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM appointments WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
