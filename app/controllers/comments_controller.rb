class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end  

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.statement
    else
      render 'show'
    end    
  end  

private 

  def comment_params
    params.require(:comment).permit(:content, :statement_id, :user_id)
  end   

end
