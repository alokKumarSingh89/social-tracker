class FetchTwitterUsersJob < ApplicationJob
  queue_as :default

  def perform(screen_name)
    follower_ids = client.follower_ids(screen_name)
    new_follower_ids = []
    existing_follower_ids = []
    follower_ids.each do |follower_id|
      user = TwitterUser.find_by(twitter_id: follower_id)
      if user.nil?
        new_follower_ids << follower_id
      else
        existing_follower_ids << follower_id
      end
    end
    new_follower_ids.each do |follower_id|
      follower = client.user(follower_id)
      user = TwitterUser.new(
        twitter_id: follower.id,
        name: follower.name,
        screen_name: follower.screen_name,
        location: follower.location,
        description: follower.description,
        url: follower.url,
        followers_count: follower.followers_count,
        statuses_count: follower.statuses_count,
        lang: follower.lang,
        profile_image_url: follower.profile_image_url,
        industry:''
      ) 
      
      if !user.save
        puts "Failed to save TwitterUser to #{follower.screen_name}"
        puts user.errors.full_messages
      end
    end
    
  end
  def client
    creds = Rails.application.credentials[:twitter]
    p creds
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = creds[:consumer_key]
      config.consumer_secret     = creds[:consumer_secret]
      config.access_token        = creds[:access_token]
      config.access_token_secret = creds[:access_token_secret]
    end
  end
end
