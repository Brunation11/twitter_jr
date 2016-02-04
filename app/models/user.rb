class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :set_username, :set_handle

  has_and_belongs_to_many :followers, class_name: "User", foreign_key: "followee_id", join_table: "followees_followers", association_foreign_key: "follower_id"
  has_and_belongs_to_many :followees, class_name: "User", foreign_key: "follower_id", join_table: "followees_followers", association_foreign_key: "followee_id"
  has_many :tweets

  validates_presence_of :full_name, :username, :email, :encrypted_password, :handle
  validates_uniqueness_of :username, :encrypted_password, :handle
  validates :username, :encrypted_password, length: { minimum: 6 }
  validates_email_format_of :email, message: 'is not looking good'


  def followee_tweets
    tweets = []
    self.followees.each do |followee|
      followee.tweets.each do |tweet|
        tweets << tweet
      end
    end
    tweets.sort{|x, y| y.updated_at <=> x.updated_at}
  end

  def set_username
    self.username = self.full_name.split.join("_")
  end

  def set_handle
    self.handle = "@#{self.full_name.split.join("_")}"
  end
end
