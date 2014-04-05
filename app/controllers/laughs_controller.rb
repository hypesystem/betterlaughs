include LaughsHelper

class LaughsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @laughs = Laugh.all
  end

  def create
    attr = params[:laugh]
    filetype = get_content_type_from_headers(attr[:file].headers)
    @laugh = Laugh.new(title: attr[:title], file: attr[:file].read, filetype: filetype)

    @laugh.save
    redirect_to @laugh
  end
end
