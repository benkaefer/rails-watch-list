class ListsController < ApplicationController

  before_action :set_list, only: %i[show destroy]

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(lists_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def lists_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
