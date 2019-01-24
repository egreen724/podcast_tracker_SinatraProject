class CreatePodcastTable < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :description
      t.integer :user_id 
    end
  end
end
