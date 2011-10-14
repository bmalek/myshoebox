class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :assignments
  has_many :roles, :through => :assignments
  
  
  after_create :elevate_to_user_role
  
  def elevate_to_user_role
    roles << Role.find(:first, :conditions => ["title LIKE ?", "User"])
    save!
    puts 'User role is successfully added!'
  end
  
  def role_symbols
    (roles || []).map {|r| r.title.downcase.to_sym}
  end
  
end
