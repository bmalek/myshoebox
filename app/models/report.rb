class Report < ActiveRecord::Base
  validates_presence_of :start_at, :end_at, :user_id   
  belongs_to :user
end
