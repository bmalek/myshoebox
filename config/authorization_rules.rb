authorization do  

  role :guest do     
    has_permission_on :users, :to => :create    
  end
  
  role :user do # this is the registered user in the site
    includes :guest
    has_permission_on :receipts, :to => :create     
    has_permission_on :receipts, :to => [:read, :update, :delete] do
      if_attribute :user => is { user }
    end
        
  end 
  
  role :accountant do
    includes :user # user role
    
    # Can see the list of all users
    has_permission_on :users, :to => :read # users model
    
    # Can see the receipts of his/her clients
    has_permission_on :receipts, :to => :read do
      if_attribute :user => {:accountant => is {user}}
    end
    
    # Can invite clients 
    has_permission_on :emails, :to => :create     
    has_permission_on :emails, :to => [:read, :update, :delete] do
      if_attribute :user => is { user }
    end
    
    # Can add users as his/her clients
    has_permission_on :clientships, :to => :manage # users model             
  end
  
  role :admin do
    has_permission_on [:users, :emails, :receipts, :roles, :clientships, :assignments], :to => :manage       
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end
  
end 

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end