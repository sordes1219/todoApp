class TasksController < ApplicationController
  
  before_action :authenticate_user!, only: %i[new create destroy edit update]

  def new
    @task = current_user.tasks.build(board_id: params[:board_id])
  end

  def create
    @task = current_user.tasks.build(board_id: params[:board_id])
    if @task.update(create_params)
      redirect_to board_path(@task.board), notice: 'タスクを新規登録しました'
    else
      flash.now[:error] = '新規登録に失敗しました'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(create_params)
      redirect_to board_path(@task.board), notice: 'タスクを更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :new
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(params[:board_id]), notice: 'タスクを削除しました'
  end

  private

  def create_params
    params.require(:task).permit(:title, :description, :deadline)
  end

end