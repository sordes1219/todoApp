class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = current_user.comments.build(task_id: params[:task_id])
  end

  def create
    @comment = current_user.comments.build(task_id: params[:task_id])
    if @comment.update(comment_params)
      redirect_to board_task_path(id: params[:task_id]), notice:'コメントを投稿しました'
    else
      flash.now[:error] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end