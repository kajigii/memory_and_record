class PrivateRoomsController < ApplicationController
  def new
    @room = Room.new
  end
end
