require_relative('../db/sql_runner.rb')
require('pry')

class Member

  attr_reader :id
  attr_accessor :name, :premium

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @premium = options['premium']
  end

  def save()
    sql = "INSERT INTO members (name, premium) VALUES ($1, $2) RETURNING id"
    values = [@name, @premium]
    member = SqlRunner.run(sql, values).first()
    @id = member['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (name, premium) = ($1, $2) WHERE id = $3"
    values = [@name, @premium, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map { |member| Member.new(member)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member = SqlRunner.run(sql, values)
    result = Member.new(member.first())
    return result
  end


end
# binding.pry
# nil
