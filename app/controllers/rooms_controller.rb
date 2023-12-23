class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
    @public_rooms = Room.where(public: true)
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

  def show
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :public)
  end
end
