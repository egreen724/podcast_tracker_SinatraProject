class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/podcasts'
    else
      erb :'/users/signup'
    end
  end

  post 'signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup' #add a flash message
    else
      @user = User.new(params[:user])
      @user.save
      session[:user_id] = @user.id
      redirect to '/podcasts'
    end 
  end


  get '/login' do
    if logged_in?
      redirect to '/podcasts'
    else
      erb :'/users/login'
    end
  end


end
