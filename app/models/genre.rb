class Genre < ActiveRecord::Base 
  has_many :podcasts, through :podcast_genres 
  has_many :users, through: :podcasts 
end