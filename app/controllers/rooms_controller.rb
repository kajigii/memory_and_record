class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
    # @rooms = Room.all # または必要なデータを取得するロジック
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
  
    if @room.save
      # 保存が成功した場合
  
      # 非公開の場合は作成者だけが入室可能にする
      ActiveRecord::Base.transaction do
        if !@room.public?
          room_user = RoomUser.create(user: current_user, room: @room, creator_only: true)
  
          # バリデーションエラーがある場合はロールバック
          unless room_user.valid?
            puts room_user.errors.full_messages
            raise ActiveRecord::Rollback
          end
        end
      end
  
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @room = Room.new(room_params)
  #   if @room.save
  #     redirect_to root_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

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
    params.require(:room).permit(:name, :public)
  end
end
