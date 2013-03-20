class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comments.all
    
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])

    respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js 
    end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js 
      end
  end

  def spam
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])      
    if current_user.flagged?(@comment, :spam_comment)
      current_user.unflag(@comment, :spam_comment)
      redirect_to comments_path, :notice => "Comment unmarked as spam!" 
    else
      current_user.flag(@comment, :spam_comment)
      redirect_to comments_path, :notice => "Comment marked as spam!" 
    end   
  end

end
