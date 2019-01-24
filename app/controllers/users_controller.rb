class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/podcasts'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do

    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup' #add a flash message
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
