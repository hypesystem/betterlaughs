include LaughsHelper
include ApplicationHelper

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

    unless attr[:source].nil? || attr[:source].empty?
        if valid_url? attr[:source]
            @laugh.source = attr[:source]
        else
            raise URI::InvalidURIError
        end
    end

    @laugh.save
    redirect_to laughs_path
  end

  def show
    @laugh = Laugh.find(params[:id])
  end

  def raw
    @laugh = Laugh.find(params[:id])
    @laugh.loads = @laugh.loads.to_i + 1;
    @laugh.save

    send_data @laugh.file, :type => @laugh.filetype, :disposition => 'inline'
  end

  def increment_views
    @laugh = Laugh.find(params[:id])
    @laugh.views = @laugh.views.to_i + 1;
    @laugh.save

    render json: { views: @laugh.views }
  end

end
