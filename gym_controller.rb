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

get '/classes' do
  @gym_classes = GymClass.all()
  erb(:"classes/index")
end
