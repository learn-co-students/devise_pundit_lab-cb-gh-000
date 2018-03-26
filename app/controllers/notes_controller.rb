class NotesController < ApplicationController
  
  def new
    
  end
  
  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'    
  end
  
  def edit
    @note = Note.find(params[:id])
    binding.pry
    # authorize @note
  end
  
  def show
  end

  def index
    @notes = policy_scope(Note)
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destory
    redirect_to(request.referrer || root_path)
    authorize @note
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
