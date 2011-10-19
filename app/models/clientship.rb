class Clientship < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :client, :class_name => "User"
  
  attr_accessible :fee, :client_id
  
  validates_presence_of :user_id, :client_id
end
