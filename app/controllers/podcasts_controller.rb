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
          flash[:warning] = "You do not have access to edit this podcast."
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
        else
          flash.now[:warning] = "You do not have access to delete this podcast."
          redirect to "/podcasts"
        end
      else
        redirect to '/login'
      end
    end

  get '/podcasts/:id/copy' do
    if logged_in?
      @podcast = Podcast.find_by_id(params[:id])
       erb :'/podcasts/copy'
     else
       redirect to '/login'
     end
  end

  post '/podcasts/:id/copy' do
    @user = User.find_by_id(session[:user_id])

    if logged_in?
      if @user.podcasts.any? {|podcast| podcast.title == params[:podcast][:title]}
        flash.now[:message] = "This podcast is already on your list." #flash message that the podcast already exists
        redirect to "/users/#{@user.slug}"
      else
        @podcast = Podcast.create(params[:podcast])
        @user.podcasts << @podcast
        @user.save
        redirect to "/users/#{@user.slug}"
      end
    else
      redirect to '/login'
    end
  end

end
