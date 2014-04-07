include LaughsHelper

class LaughsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    num_items = 10
    offset = params[:offset].to_i ||= 0
    all_laughs = Laugh.all.sort{|x,y| y.created_at <=> x.created_at}

    @laughs = all_laughs[offset,num_items]
    @next_offset = offset + num_items
    @more_items = all_laughs.size > @next_offset
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
