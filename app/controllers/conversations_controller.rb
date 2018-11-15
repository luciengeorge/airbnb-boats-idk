class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :conversations_and_users, only: %i[index show]
  before_action :find_conversation, only: :show
  def index
    @conversation = Conversation.new
  end

  def show
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    @messages.last.read = true if @messages.last && (@messages.last.user_id != current_user.id)
    @message = @conversation.messages.new
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_path(@conversation)
  end

  private

  def conversations_and_users
    @conversations = Conversation.all
    @users = User.all
  end

  def find_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
