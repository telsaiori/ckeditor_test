class GuestbooksController < ApplicationController
  respond_to :json

  def index
    respond_with Guestbook.all
  end
end
