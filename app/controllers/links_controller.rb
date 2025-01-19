class LinksController < ApplicationController
  before_action :set_link, only: [:show]
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      index
      render :index,status: :unprocessable_entity
    end
  end

  def show

  end

  def index
    @links = Link.recent_first
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
