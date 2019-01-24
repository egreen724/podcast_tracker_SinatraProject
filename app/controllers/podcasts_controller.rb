class PodcastsController < ApplicationController


  get "/podcasts" do
    erb :"/podcasts/all_podcasts"

  end
end
