require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/member.rb')
require_relative('./models/gym_class.rb')
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

get '/classes' do # INDEX
  @gym_classes = GymClass.all()
  erb(:"classes/index")
end

get '/classes/new' do # NEW
  erb(:"classes/new")
end

get '/classes/:id' do # SHOW
  @gym_class = GymClass.find(params[:id])
  erb(:"classes/show")
end

post '/classes' do # CREATE
  gym_class = GymClass.new(params)
  gym_class.save()
  redirect to '/classes'
end
