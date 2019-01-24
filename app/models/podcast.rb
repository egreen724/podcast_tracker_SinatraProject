class Podcast < ActiveRecord::Base
  belongs_to :user

  get "/podcasts" do
    erb :all_podcasts
    
  end

end
