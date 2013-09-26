class Picture < ActiveRecord::Base
  attr_accessible :artist, :title, :url, :category
  belongs_to :user
  has_many :comments
  has_many :users, :through => :comments
  validates :artist, :title, :presence => :true
end

