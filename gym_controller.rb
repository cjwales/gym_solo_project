require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/member.rb')
require_relative('./models/gym_class.rb')
require_relative('./models/booking.rb')
also_reload('./models/*')

get '/' do # HOME
  erb(:welcome)
end

get '/members' do # INDEX
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do # NEW
  erb(:"members/new")
end

get '/members/:id' do # SHOW
  @member = Member.find(params[:id])
  erb(:"members/show")
end

post '/members' do # CREATE
  member = Member.new(params)
  member.save()
  redirect to '/members'
end

get '/members/:id/edit' do # EDIT
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

post '/members/:id' do # UPDATE
  Member.new(params).update()
  redirect to '/members'
end

post '/members/:id/delete' do # DELETE
  member = Member.find(params[:id])
  member.delete()
  redirect to '/members'
end

get '/classes' do # INDEX
  @gym_classes = GymClass.all()
  erb(:"classes/index")
end

get '/classes/new' do # NEW
  erb(:"classes/new")
end

get '/classes/:id' do # SHOW
  @gym_class = GymClass.find(params[:id])
  @bookings = Booking.find_all(params[:id])
  erb(:"classes/show")
end

post '/classes' do # CREATE
  gym_class = GymClass.new(params)
  gym_class.save()
  redirect to '/classes'
end

get '/classes/:id/edit' do # EDIT
  @gym_class = GymClass.find(params[:id])
  erb(:"classes/edit")
end

post '/classes/:id' do # UPDATE
  GymClass.new(params).update()
  redirect to '/classes'
end

post '/classes/:id/delete' do # DELETE
  gym_class = GymClass.find(params[:id])
  gym_class.delete()
  redirect to '/classes'
end

get '/bookings' do # INDEX
  @bookings = Booking.all
  erb (:"bookings/index")
end

get '/bookings/new' do # NEW
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do # CREATE
  booking = Booking.new(params)
  booking.save
  redirect to '/bookings'
end

post '/bookings/:id/delete' do # DELETE
  Booking.delete(params[:id])
  redirect to '/bookings'
end
