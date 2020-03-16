class CreatePodcastTable < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :description
      t.integer :user_id
    end
  end
end
