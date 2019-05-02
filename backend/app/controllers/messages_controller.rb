class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    messages = Message.all

    render json: messages
  end

  def show
    render json: message
  end

  def create
    message = Message.new(message_params)

    if message.save
      render json: message, status: :created, location: message
    else
      render json: {error: "Message was not created"}, status: 400
    end
  end

  def update
    if message.update(message_params)
      render json: message
    else
      render json: {error: "Message was not updated."}, status: 451
    end
  end

  def destroy
    message.destroy
  end

  private
  
    def set_message
     message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :group_id)
    end
end
