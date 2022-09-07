class CreateTwitterUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_users do |t|
      t.string :twitter_id, :null => false
      t.string :name
      t.string :screen_name, :null => false
      t.string :location
      t.string :description
      t.integer :followers_count
      t.integer :statuses_count
      t.string :lang
      t.string :profile_image_url
      t.string :industry
      t.string :primary_lang
      t.string :secondary_lang

      t.timestamps
    end
  end
end
