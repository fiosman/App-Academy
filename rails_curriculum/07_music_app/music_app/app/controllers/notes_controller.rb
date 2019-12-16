class NotesController < ApplicationController 

  before_action :require_log_in!

  def create
    note = current_user.notes.new(note_params) 
    
    if note.save! 
      flash[:notice] = "Note created!"
      redirect_to track_url(note.track_id) 
    else 
      flash.now[:errors] = note.errors.full_messages
      redirect_to track_url(note.track_id)
    end
  end 

  def destroy 
    note = Note.find(params[:id]) 

    if current_user.id == note.user_id
      note.destroy  
      redirect_to track_url(note.track_id)
    else 
      render json: '403 FORBIDDEN' 
    end
  end

  private 

  def note_params 
    params.require(:note).permit(:track_id, :note)
  end
end 

