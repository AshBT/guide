class NotesController < ApplicationController

  def show
    @note = Note.find(params[:id])
  end

  def new 
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params[:note])
      if @note.save
        render :show, flash[:notice] => "Saved!"
      else
        render :new
      end
  end

  def update 
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to :subject
  end

  def search
    @search = Note.search(:include => [:subjects]) do 
      keywords(params[:q])
    end
  end


end
