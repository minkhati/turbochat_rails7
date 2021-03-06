class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    set_data
    render 'index'
  end
  
  def show
    @single_room = Room.find(params[:id]) if params[:id]
    set_data
    
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render 'index'
  end
  
  def create
    @room = Room.create(room_params)
  end
  
  private
  
    def room_params
      params.require(:room).permit(:name)
    end
    
    def set_data
      @room = Room.new
      @rooms = Room.public_rooms
      @users = User.all_except(current_user)
    end
end
