class Tweet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :hashtags, foreign_key: "hashtag_id", join_table: "tweet_hashtags", association_foreign_key: "tweet_id"

  validates_presence_of :content
  validates :content, length: { maximum: 140 }

  after_save :create_hashtags

  def create_hashtags
    hashtags = content.scan(/#\w+/).map{ |hashtag| hashtag.sub('#', '') }
    hashtags.each do |hashtag|
      htag = Hashtag.find_or_create_by(name: hashtag)
      self.hashtags << htag
    end
  end
end