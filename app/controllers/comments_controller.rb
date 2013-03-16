class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comments.all
    
  end

  def create
    @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params[:comment])
      respond_to do |format|
        if @comment.save
          format.html { redirect_to(@post, :notice => 'Comment was successfully created.') }
          format.xml  { render :xml => @post, :status => :created, :location => @post }
        else
          format.html { redirect_to(@post, :notice => 'Comment could not be saved. Please fill in all fields')}
          format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        end
      end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @post = Post.find(params[:post_id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to(@post, :notice => 'Comment was successfully deleted.') }
        format.xml  { head :ok }
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
