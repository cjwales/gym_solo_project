require_relative('../db/sql_runner.rb')
require('pry')

class Member

  attr_reader :id
  attr_accessor :name, :membership

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @membership = options['membership']
  end

  def save()
    sql = "INSERT INTO members (name, membership) VALUES ($1, $2) RETURNING id"
    values = [@name, @membership]
    member = SqlRunner.run(sql, values).first()
    @id = member['id'].to_i()
  end

  def update()
    sql = "UPDATE members SET (name, membership) = ($1, $2) WHERE id = $3"
    values = [@name, @membership, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def gym_classes()
    sql = "SELECT gym_classes.* FROM gym_classes INNER JOIN appointments ON appointments.class_id = gym_classes.id WHERE member_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_class| GymClass.new(gym_class) }
  end

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map { |member| Member.new(member) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member = SqlRunner.run(sql, values)
    result = Member.new(member.first())
    return result
  end

  # def get_premium()
  #   if @member.premium == true
  #     return "Premium"
  #   else
  #     return "Basic"
  #   end
  # end

  # def display_premium()
  #   if @member.premium == true
  #     return "Premium Member"
  #   elsif return "Basic Member"
  #   end
  # end


end
# binding.pry
# nil
