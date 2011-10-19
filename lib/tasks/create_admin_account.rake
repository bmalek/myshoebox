namespace :db do
  
  namespace :admin do
    
    desc "Create roles: Admin, User, Accountant and Client."
    task :install_roles => :environment do
      puts "Adding necessary Roles to the database..."
        Role.find(:first, :conditions => ["title LIKE ?", "Admin"]) || Role.create(:title =>"Admin") 
        Role.find(:first, :conditions => ["title LIKE ?", "User"]) || Role.create(:title =>"User")   
        Role.find(:first, :conditions => ["title LIKE ?", "Accountant"]) || Role.create(:title =>"Accountant")         
    end
      
    desc "Create the Admin and User roles if not exists, and create the admin_user."
    task :create => :install_roles do    
      puts "Seeding the database with admin_user..."
      if User.where("roles.title" => 'Admin').includes(:roles).empty?              
        create_admin_user
      else 
        puts "An Admin user already exists.\nAborting rake!"
      end
    end
    
    
    ####################################
    def prompt_for_admin_password
      password = ask('Password [secret123]: ', String) do |q|
        q.echo = false
        q.validate = /^(|.{5,40})$/
        q.responses[:not_valid] = "Invalid password. Must be at least 5 characters long."
        q.whitespace = :strip
      end
      password = "secret123" if password.blank?
      password
    end
  
    def prompt_for_admin_email
      email = ask('Email [admin@avacano.com]: ', String) do |q|
        q.echo = true
        q.whitespace = :strip
      end
      email = "admin@avacano.com" if email.blank?
      email
    end
  
    def create_admin_user
      if ENV['AUTO_ACCEPT']
        password =  "secret123"
        email =  "admin@avacano.com"
      else
        require 'highline/import'
        puts "Create the admin user (press enter for defaults)."      
        email = prompt_for_admin_email
        password = prompt_for_admin_password
      end
      attributes = {
        :password => password,
        :password_confirmation => password,
        :email => email    
      }
      
      if User.find_by_email(email)
        say "\nWARNING: There is already a user with the email: #{email}, so no account changes were made.  If you wish to create an additional admin user, please run rake db:admin:create again with a different email.\n\n"
      else
        
        admin_role = Role.find(:first, :conditions => ["title LIKE ?", "Admin"]) || Role.create(:title =>"Admin") 
           
        admin = User.create(attributes)
        # create an admin role and and assign the admin user to that role                  
        admin.roles << admin_role
        admin.save
        say "\nAdmin user is successfully create."
      end
    end      
              
  end 
end