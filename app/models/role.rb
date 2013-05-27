class Role < ActiveRecord::Base
  
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  attr_accessible :name, :resource_id, :user_ids, :resource_type
  has_paper_trail
  scopify
  rails_admin do 
  	visible do
	    # controller bindings is available here. Example:
	    bindings[:controller].current_user.has_role? :admin
	  end

  end
end
