class User < ActiveRecord::Base 
  has_secure_password 
  has_many :podcasts 
  has_many :genres, through: :podcasts 
  
end
