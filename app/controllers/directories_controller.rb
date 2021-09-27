class DirectoriesController < ApplicationController

  def index
    @directories = Directory.root_path
  end

  def show
    @directory = Directory.find(params[:id])
    @subdirectories = Directory.childrens(params[:id])
  end

  def new
    @directory = Directory.new
  end

  def create
    @directory = Directory.new(resource_params)
    if @directory.save
      if resource_params[:parent_id].present?
        redirect_to action: 'show', id: resource_params[:parent_id]
      else
        redirect_to action: 'index'
      end
    else
      render :new
    end
  end

  def destroy 
    @directory = Directory.find(params[:id])
    @directory.destroy
    redirect_to directory_index_path
  end

  private

  def resource_params
    params.require(:directory).permit(:title, :parent_id)
  end
end
