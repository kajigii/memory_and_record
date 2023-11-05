class WordsController < ApplicationController
  def index
    @word = Word.new
    @room = Room.find(params[:room_id])
    @words = @room.words.includes(:user)
  end

  def new
    @word = Word.new
    @room = Room.find(params[:room_id])
    @words = @room.words.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @word = @room.words.new(word_params)
    if @word.save
      redirect_to room_words_path(@room)
    else
      @words = @room.words.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to root_path
  end

  # def edit
  #   @word = Word.find(params[:id])
  # end

  # def update
  #   word = Word.find(params[:id])
  #   word.update(word_params)
  #   redirect_to root_path
  # end

  private

  def word_params
    params.require(:word).permit(:content, :image).merge(user_id: current_user.id)
  end
end
