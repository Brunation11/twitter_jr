class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :followers, class_name: "User", foreign_key: "followee_id", join_table: "followees_followers", association_foreign_key: "follower_id"
  has_and_belongs_to_many :followees, class_name: "User", foreign_key: "follower_id", join_table: "followees_followers", association_foreign_key: "followee_id"
  has_many :tweets

  validates_presence_of :first_name, :last_name, :username, :email, :password, :handle
  validates_uniqueness_of :username, :password, :handle
  validates :username, :password, length: { minimum: 6 }
  validates_email_format_of :email, message: 'is not looking good'
end
