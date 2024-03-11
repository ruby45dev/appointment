require 'sinatra'

get '/' do
    erb :index
end

post '/' do
    @user_name = params[:user_name]
    @phone = params[:phone]
    @email = params[:email]
    @date_time = params[:date_time]

    f = File.open('./public/user.txt', 'a')
    f.write "User: #{@user_name}, Phone: #{@phone}, Email: #{@email}, Date: #{@date_time}\n"
    f.close

    erb :index
end

get '/' do
    erb :about
end

get 'contacts' do
    erb :contacts
end

