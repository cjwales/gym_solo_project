require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/member.rb')
require_relative('./models/gym_class.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do
  erb(:"members/new")
end

get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

post '/members' do
  member = Member.new(params)
  member.save()
  redirect to '/members'
end

get '/classes' do
  @gym_classes = GymClass.all()
  erb(:"classes/index")
end

get '/classes/new' do
  erb(:"classes/new")
end

get '/classes/:id' do
  @gym_class = GymClass.find(params[:id])
  erb(:"classes/show")
end

post '/classes' do
  gym_class = GymClass.new(params)
  gym_class.save()
  redirect to '/classes'
end
