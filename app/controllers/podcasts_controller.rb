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
    erb :'/podcasts/new_podcast'
  end

  post "/podcasts" do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      @podcast = Podcast.new(:title => params[:title], :description => params[:description])
      @user.podcasts << @podcast
      @user.save
    else
      redirect to '/login'
    end
  end

end
