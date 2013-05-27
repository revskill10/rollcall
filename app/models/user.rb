class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :post_ids
  # attr_accessible :title, :body
  has_many :posts, :dependent => :destroy, :inverse_of => :user
  has_paper_trail

  

  rails_admin do 
  	visible do
	    # controller bindings is available here. Example:
	    bindings[:controller].current_user.has_role? :admin
	  end    
  end
  def title
  	email
  end
end
