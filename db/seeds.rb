require_relative('../models/member.rb')
require_relative('../models/gym_class.rb')
require_relative('../models/booking.rb')
require('pry')

member1 = Member.new({
  'name' => 'Christopher Wales',
  'membership' => 'Premium'
  })

member2 = Member.new({
  'name' => 'Suzanne Taylor',
  'membership' => 'Basic'
  })

  # member1.save()
  # member2.save()
  # member1.premium = false
  # member1.name = 'John Wales'
  # member1.update()
  # member2.delete()

gym_class1 = GymClass.new({
    'name' => 'Yoga',
    'start_time' => '10:30',
    'max_capacity' => 10
    })

gym_class2 = GymClass.new({
  'name' => 'Spin',
  'start_time' => '08:00',
  'max_capacity' => 20
  })

gym_class3 = GymClass.new({
  'name' => 'Aerobics',
  'start_time' => '06:00',
  'max_capacity' => 15
  })

# gym_class1.save()
# gym_class2.save()
# gym_class3.save()
# gym_class3.max_capacity = 25
# gym_class3.update()
# gym_class3.delete()

booking1 = Booking.new({
  'member_id' => member1.id,
  'class_id' => gym_class1.id
  })

booking2 = Booking.new({
  'member_id' => member2.id,
  'class_id' => gym_class2.id
  })

# booking1.save()
# booking2.save()

binding.pry
nil
