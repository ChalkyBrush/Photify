class Comment < ActiveRecord::Base
  attr_accessible :message, :picture_id, :user_id


  belongs_to :picture
  belongs_to :user

  validates :message, :presence => :true

end
