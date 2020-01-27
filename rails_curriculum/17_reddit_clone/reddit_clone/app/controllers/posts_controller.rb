class Post < ApplicationController 

  before_action :verify_author, only: [:edit, :update]

  def create 
    @post = current_user.posts.new(post_params) 
    
    if @post.save 
      redirect_to post_url(@post) 
      flash[:notices] = ['Post successfully added!']
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end 

  def new
    @post = Post.new 
    render :new 
  end 

  def show 
    @post = Post.find(params[:id]) 
    render :show 
  end 

  def edit 
    @post = Post.find(params[:id]) 
    render :edit 
  end 

  def update  
    @post = Post.find(params[:id]) 

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)  
      flash[:notices] = ['Post successfully updated'] 
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :edit 
    end
  end 

  def destroy 
    @post = Post.find(params[:id]) 
    
    if @post.destroy 
      flash[:notices] = ['Post deleted!']
    end 

    redirect_to subs_url
  end

  private 

  def post_params 
    params.require(:post).permit(:title, :content, :url, :sub_id)
  end 

  def verify_author 
    post = Post.find(params[:id]) 
    if current_user != post.author 
      flash[:notices] = ['Cannot edit a post that is not your own!']
      redirect_to request.referer
    end
  end 

end