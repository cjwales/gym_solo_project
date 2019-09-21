require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/member.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end
