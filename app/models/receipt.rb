class Receipt < ActiveRecord::Base
  
  belongs_to :user 
  attr_accessible :payment, :title, :amount, :description, :issued_at, 
  :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  
  validates_presence_of :user_id, :payment
  
  has_attached_file :photo, :styles => { :small => "150x150>" }#,   
  #:url => "/assets/receipts/:id/:style/:basename.:extension",
  #:path => ":rails_root/app/assets/receipts/:id/:style/:basename.:extension"
  
  #:storage => :s3,
  #:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  #:path => ":attachment/:id/:style.:extension",
  #:bucket => 'myshoebox'  
  #:path => ":class/:attachment/:token/:style.:extension",  
  #:default_url => "/images/photo01.jpg"
  
  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/tiff', 'image/jpeg', 'image/jpg', 
    'image/png', 'image/gif', 'application/pdf', 'application/doc', 'application/docx']
               
      
   
end
