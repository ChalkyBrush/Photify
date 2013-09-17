class Comment < ActiveRecord::Base
  attr_accessible :comment, :picture_id, :user_id

  belongs_to :pictures
  belongs_to :users
end
