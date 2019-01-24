class Podcast < ActiveRecord::Base
  belongs_to :user

  def slug
    binding.pry 
    self.title.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Podcast.all.find{|podcast| podcast.slug == slug}
  end

end
