class TwitterWidget < Apotomo::Widget

  def display
  	#@posts = Post.find(:all)
  	@posts = Post.paginate(:page => params[:page], :per_page => 2)
    render
  end

end
