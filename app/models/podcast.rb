class Podcast < ActiveRecord::Base 
  has_many :users #belongs_to :users 
  has_many :genres 
end