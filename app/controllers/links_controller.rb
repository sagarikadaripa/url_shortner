class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Shortened Link has been successfully created."
      redirect_to root_path
    else
      index
      render :index,status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: 'Link has been successfully deleted.'
  end

  def edit
  end

  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show

  end

  def update
    if @link.update(link_params)
      flash[:success] = "Link has been successfully updated."
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
