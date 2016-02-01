class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tweets, foreign_key: "tweet_id", join_table: "tweet_hashtags", association_foreign_key: "hashtag_id"

  validates_presence_of :name
end
