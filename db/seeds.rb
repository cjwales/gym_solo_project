require_relative('../models/member.rb')
require_relative('../models/gym_class.rb')
require('pry')

member1 = Member.new({
  'name' => 'Christopher Wales',
  'premium' => true
  })

member2 = Member.new({
  'name' => 'Suzanne Taylor',
  'premium' => false
  })

  member1.save()
  member2.save()
  member1.premium = false
  member1.name = 'John Wales'
  member1.update()
  member2.delete()
  binding.pry
  nil
