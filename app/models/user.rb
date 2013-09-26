class User < ActiveRecord::Base
  attr_accessible :profile_picture, :email, :first_name, :last_name, :password, :password_confirmation
  has_secure_password
  has_many :pictures
  validates_presence_of :first_name, :last_name, :email, :password, :on => :create
  validates_uniqueness_of(:email)

  has_many :comments
  has_many :pictures, :through => :comments
end
