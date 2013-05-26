class Post < ActiveRecord::Base

  
  attr_accessible :body, :title, :user_id
  has_paper_trail
  belongs_to :user
  resourcify

  rails_admin do   	
  	parent User
  	edit do
      field :body, :text do
        bootstrap_wysihtml5 true
      end
    end
  end
end
