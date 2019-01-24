class PodcastsController < ApplicationController


  get "/podcasts" do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      erb :"/podcasts/all_podcasts"
    else
      redirect to '/login'
    end
  end

  get "/podcasts/new" do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      erb :'/podcasts/new_podcast'
    end
  end

  post "/podcasts" do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      @podcast = Podcast.create(params[:podcast])
      @user.podcasts << @podcast
      @user.save
      redirect to "/users/#{@user.slug}"
    else
      redirect to '/login'
    end
  end

end
