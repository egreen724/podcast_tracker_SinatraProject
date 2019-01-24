class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/podcasts'
    else
      erb :'/users/signup'
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
