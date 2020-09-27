class BoardsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(create_params)
    if @board.save
      redirect_to boards_path, notice: 'ボードを新規登録しました'
    else
      flash.now[:error] = '新規登録に失敗しました'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(create_params)
      redirect_to boards_path, notice: 'ボードを更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to boards_path, notice: 'ボードを削除しました'
  end

  private

  def create_params
    params.require(:board).permit(:title, :description)
  end

end