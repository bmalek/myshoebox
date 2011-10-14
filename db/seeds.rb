puts "Seeding the database ..."

admin_role = Role.find(:first, :conditions => ["title LIKE ?", "Admin"]) || Role.create(:title =>"Admin") 

user_role = Role.find(:first, :conditions => ["title LIKE ?", "User"]) || Role.create(:title =>"User")

admin_user = User.find(:first, :conditions => ["email LIKE ?", "admin@avacano.com"])

unless admin_user 
  admin_user = User.create!(:email => "admin@avacano.com", :password => "root20", :password_confirmation => "root20")  
  Assignment.create(:role_id => admin_role.id, :user_id => admin_user.id)  
  puts "Admin user is suceesfully created."
else
  puts "Admin user already exists."
end


