class RoomsController < ApplicationController

  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    # if params[:room][:public]
    #   create_public_room
    # else
    #   create_private_room
    # end

    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  # def create_public_room
  #   @room = PublicRoom.new(room_params)
  #   if @room.save
  #     redirect_to root_path, notice: '公開ルームが作成されました'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def create_private_room
  #   @room = PrivateRoom.new(room_params)
  #   if @room.save
  #     redirect_to root_path, notice: '非公開ルームが作成されました'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def room_params
  #   params.require(:room).permit(:name, :public, user_ids: [])
  # end

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
