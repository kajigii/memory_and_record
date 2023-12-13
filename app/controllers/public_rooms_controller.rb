class PublicRoomsController < ApplicationController
  def new
    @room = Room.new
  end
end
