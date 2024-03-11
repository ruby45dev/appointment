require 'sinatra'

get '/' do
    erb :index
end

post '/' do
    @user_name = params[:user_name]
    @phone = params[:phone]
    @email = params[:email]
    @date_time = params[:date_time]

    @title = 'Дякуєм!'
    @message = "Шановний #{@user_name} ваше звернення прийнято."

    f = File.open('./public/user.txt', 'a')
    f.write "User: #{@user_name}, Phone: #{@phone}, Email: #{@email}, Date: #{@date_time}\n"
    f.close

    erb :message
end

get '/' do
    erb :about
end
