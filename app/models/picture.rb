class Picture < ActiveRecord::Base
  attr_accessible :artist, :title, :url, :category
  belongs_to :user
  has_many :reviews
  has_many :users, :through => :reviews
  validates :artist, :title, :presence => :true
end

