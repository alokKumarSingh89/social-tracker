class TwitterUsersController < ApplicationController
    def index
        @twitter_users = TwitterUser.all
    end
    
end
