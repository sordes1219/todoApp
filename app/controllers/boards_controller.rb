class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @board = current_user.boards.build
  end
end