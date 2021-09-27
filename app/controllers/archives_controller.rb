class ArchivesController < ApplicationController

  def index
    @archives = Archive.all
  end

  def show
    @archive = Archive.find(params[:id])
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new
    @archive.value = File.open(params[:archive][:file].tempfile, 'rb') { |io| io.read }
    @archive.title = params[:archive][:file].original_filename
    @archive.directory_id = params[:archive][:directory_id]
    if @archive.save
      redirect_to controller: 'directories', action: 'show', id: @archive.directory_id
    else
      render 'new'
    end
  end

  def destroy 
    @archive = Archive.find(params[:id])
    @archive.destroy
    redirect_to action: 'index'
  end

  def download
    archive = Archive.find(params[:id])
    send_data(archive.value, filename: archive.title)
  end
end