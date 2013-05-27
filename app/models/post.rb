class Post < ActiveRecord::Base

  
  attr_accessible :body, :title, :user_id, :role_ids
  has_paper_trail
  belongs_to :user
  has_many :roles, :as => :resource
  resourcify
  
  rails_admin do   
    list do 
      configure :user do
        visible false
      end
    end	      
    show do 
      field :title 
      field :body do 
        formatted_value do # used in form views
          (bindings[:object].body).html_safe
        end
      end
      field :user_id do  
        pretty_value do 
          bindings[:object].user.email
        end
      end
      field :roles
    end     
  	create do
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :title do 
      end
      field :body, :text do
        bootstrap_wysihtml5 true
      end
      
    end

    edit do
      field :user  do
        read_only true
        pretty_value do 
          bindings[:object].user.email
        end
      end
      field :title do 
      end
      field :body, :text do
        bootstrap_wysihtml5 true
      end

    end
  end
end
