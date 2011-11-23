class Receipt < ActiveRecord::Base
  
  belongs_to :user 
  attr_accessible :payment, :title, :amount, :description, :issued_at, 
  :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  
  validates_presence_of :user_id, :payment, :issued_at, :payment
  
  has_attached_file :photo, :styles => { :small => "150x150>" },   
    #:url => "/assets/receipts/:id/:style/:basename.:extension",
    #:path => ":rails_root/app/assets/receipts/:id/:style/:basename.:extension"
    #:default_url => "/images/photo01.jpg"    
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",    
    :bucket => 'myshoebox' # "paperclip-example-bucket-#{Rails.env}"           
    
  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/tiff', 'image/jpeg', 'image/jpg', 
    'image/png', 'image/gif', 'application/pdf', 'application/doc', 'application/docx']
               
  def self.search(start_at, end_at)
    if start_at && end_at
      where('issued_at >= ? && issued_at <= ?', start_at, end_at)
    else
      scoped
    end
  end    
   
end
