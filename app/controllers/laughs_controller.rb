include LaughsHelper

class LaughsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @laughs = Laugh.all.sort{|x,y| y.created_at <=> x.created_at}.take(10)
  end

  def create
    attr = params[:laugh]
    filetype = get_content_type_from_headers(attr[:file].headers)
    @laugh = Laugh.new(title: attr[:title], file: attr[:file].read, filetype: filetype)

    @laugh.save
    redirect_to laughs_path
  end

  def show
    @laugh = Laugh.find(params[:id])
  end

  def raw
    @laugh = Laugh.find(params[:id])

    send_data @laugh.file, :type => @laugh.filetype, :disposition => 'inline'
  end

end
