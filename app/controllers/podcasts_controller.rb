class PodcastsController < ApplicationController

  get "/podcasts" do #index
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      erb :"/podcasts/all_podcasts"
    else
      redirect to '/login'
    end
  end

  get "/podcasts/new" do #create
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      erb :'/podcasts/new_podcast'
    end
  end

  post "/podcasts" do #create
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

  get "/podcasts/:id" do #read
    @podcast = Podcast.find_by_id(params[:id])
    erb :'/podcasts/show_podcast'

  end

  get "/podcasts/:id/edit" do #update
    if logged_in?
      @podcast = Podcast.find_by_id(params[:id])
      if @podcast && @podcast.user == current_user
        erb :'/podcasts/edit_podcast'
      else
        redirect to "/podcasts"
      end
    else
      redirect to "/login"
    end
  end

  patch "/podcasts/:id" do #update
    if logged_in?
      if params[:podcast][:title] == ""
        redirect to "/podcasts/#{params[:id]}/edit"
      else
        @podcast = Podcast.find_by_id(params[:id])
        if @podcast && @podcast.user == current_user
          @podcast.update(params[:podcast])
          redirect to "/podcasts/#{params[:id]}"
        else
          redirect to "/podcasts"
        end
      end
    else
      redirect to "/login"
    end
  end

  delete '/podcasts/:id/delete' do
      if logged_in?
        @podcast = Podcast.find_by_id(params[:id])
        if @podcast && @podcast.user == current_user
          @podcast.delete
        end
        redirect to "/users/#{@podcast.user.slug}"
      else
        redirect to '/login'
      end
    end

  get '/podcasts/:id/copy' do
    @podcast = Podcast.find_by_id(params[:id])

     erb :'/podcasts/copy'
  end

end
