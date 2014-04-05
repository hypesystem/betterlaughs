class LaughsController < ApplicationController
  protect_from_forgery with: :exception

  def index

  end

  def create
    render text: params[:laugh].inspect
  end
end
