class HomeController < ApplicationController
  include Apotomo::Rails::ControllerMethods
  before_filter :authenticate_user!
  has_widgets do |root|
  	root << widget('twitter', 'my_twitter')
  end	
  def index
  end
  def lookup  	 
  	 query = params[:q]
  	 puts query 
  	 @users = User.where("email LIKE  ?", "%#{query}%")
  	 render :json => @users.as_json(:only => [:email])
  end
end
