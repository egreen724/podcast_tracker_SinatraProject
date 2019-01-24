require 'rack-flash'

class UsersController < ApplicationController
use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/podcasts'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    binding.pry
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please fill in the appropriate fields to create an account."
      redirect to '/signup' #add a flash message
    elsif !params[:email].include?("@")
      flash[:message] = "Please fill in the appropriate fields to create an account."
      redirect to '/signup'
    else
      @user = User.create(params[:user])
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

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/podcasts'
    else
      flash[:message] = "Could not find an existing account. Please create an account."
      redirect to '/signup'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    erb :"/users/show_user"
  end

  get "/logout" do
     if logged_in?
       session.destroy
       redirect "/login"
     else
       redirect "/"
     end
   end

end
