require 'sinatra'

get '/' do
    erb :index
end

post '/welcome' do
    @user_name = params[:user_name]
    @phone = params[:phone]
    @email = params[:email]
    @date_time = params[:date_time]
    @fio = params[:fio]
    @error = params[:error]

    f = File.open('./public/user.txt', 'a')
    f.write "User: #{@user_name}, Phone: #{@phone}, Email: #{@email}, Date: #{@date_time}, FIO: #{@fio}\n"
    f.close

    erb :welcome
end

get '/welcome' do
    erb :welcome
end

get '/about' do
    erb :about
end

get '/contacts' do
    erb :contacts
end

