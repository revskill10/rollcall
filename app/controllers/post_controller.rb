class PostController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource

  
  def update
  	@post = Post.find(params[:id])

	  respond_to do |format|
	    if @post.update_attributes(params[:post])
	      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
	      format.json { head :no_content } # 204 No Content
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @post.errors, status: :unprocessable_entity }
	    end
	  end
  end
end
