# == Schema Information
#
# Table name: twitter_users
#
#  id                :bigint           not null, primary key
#  twitter_id        :string           not null
#  name              :string
#  screen_name       :string           not null
#  location          :string
#  description       :string
#  followers_count   :integer
#  statuses_count    :integer
#  lang              :string
#  profile_image_url :string
#  industry          :string
#  primary_lang      :string
#  secondary_lang    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class TwitterUser < ApplicationRecord
end
