class HomeController < ApplicationController

  before_filter :authenticate_user!  

  def index
  	if current_user.has_role? :reader, Post 
  		@posts = current_user.posts
  	else
  		@posts = []
  	end
  end
end
