class InboxesController < ApplicationController
  def show
    @inbox = current_user.inbox
    @conversations = @inbox.conversations
  end
end
