class WordsController < ApplicationController
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    @word = Word.new
    @room = Room.find(params[:room_id])
    @words = @room.words.includes(:user)
    @public_rooms = Room.where(public: true)
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
    @room = Room.find(params[:room_id])
    word.destroy
    redirect_to room_words_path(@room)
  end

  def edit
    @word = Word.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  def update
    word = Word.find(params[:id])
    @room = Room.find(params[:room_id])
    word.update(word_params)
    redirect_to room_words_path(@room)
  end

  def show
    @word = Word.find(params[:id])
    @room = Room.find(params[:room_id])
    @public_rooms = Room.where(public: true)
  end

  private

  def word_params
    params.require(:word).permit(:content, :image, :person, :source).merge(user_id: current_user.id)
  end

  def move_to_index
    @word = Word.find(params[:id])
    if current_user != @word.user
      redirect_to root_path
    end
  end

  def set_word
    @word = Word.find(params[:id])
  end
end


