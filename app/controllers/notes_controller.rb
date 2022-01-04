class NotesController < ApplicationController
  before_action :set_note, only: [:show]

  def index
    @notes = Note.all
  end

  def show
    render_not_found unless @note
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.create note_params
    unless note.valid?
      return redirect_to new_note_path,
                         alert: note.errors.full_messages
    end
    redirect_to note_path(note)
  end


  private

  def set_note
    @note = Note.find_by_id(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :text)
  end

end