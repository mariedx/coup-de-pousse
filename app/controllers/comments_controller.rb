class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.first
    @comment = Comment.new(post_params)
    @comment.garden_id = params[:garden_id]
    @comment.user_id = @user.id

    if @comment.save
      flash[:notice] = "New comment Save in DB"
      redirect_to garden_path(@comment.garden_id)
    else
      puts @comment.errors.messages
      puts "error comments"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @garden = Garden.find(params[:garden_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      flash[:notice] = "Comments updated in DB"
      redirect_to garden_path(params[:garden_id])
    else
      flash.now[:alert] = "We cannot updated this comments for this reason(s) :"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted in DB"
      redirect_to garden_path(params[:garden_id]) 
    else 
      flash.now[:alert] = "We cannot deleted this comment for this reason(s) :"
      render :edit
    end
  end

  private
  def post_params
    params.require(:comment).permit(:content)
  end
end
