class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:edit, :update]

  def index
    @messages = Message.all
    @message = Message.new
  end

  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :back, notice: "Message sent"
    else
      render 'new'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :back, notice: "Message Deleted"
  end

private
  def message_params
    params.require(:message).permit(:to_id, :from_id, :content)
  end
end
