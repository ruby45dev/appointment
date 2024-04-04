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

    errors_answer = {
        user_name: "Введіть ваше ім'я",
        phone: "Введіть ваш номер телефону",
        email: "Введіть ваш email",
        date_time: "Введіть дату",
        fio: "Виберіть прізвище фахівця"
    }

    errors_answer.each do |key, value|
        if params[key].empty?
           @error = errors_answer[key]
           erb :welcome
        end
    end

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