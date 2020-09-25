class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(create_params)
    if @board.save
      redirect_to 'boards_path', notice: 'ボードを新規登録しました'
    else
      flash.now[:error] = '失敗しました'
      render :new
    end
  end

  private

  def create_params
    params.require(:board).permit(:title, :description)
  end

end