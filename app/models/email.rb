class Email < ActiveRecord::Base
  
  addr_frmt = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i #/^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i                
      
  validates :address, :presence => true, :uniqueness => true, :format => { :with => addr_frmt }
  
  belongs_to :user 
  
end
