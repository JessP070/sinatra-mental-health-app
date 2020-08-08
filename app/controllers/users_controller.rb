class UsersController < ApplicationController
   
    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(email: params[:id])

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect "users/#{@user.id}"
            
        else 

        end
    end
    
    
    get '/signup' do
        
        erb :signup

    end 

    post '/users' do
        

    end


    get '/users/:id' do
        "user page"
    end


end