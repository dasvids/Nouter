class NotesController < ApplicationController

  attr_accessor :note, :notes

  before_action :set_note, only: %i[show edit update destroy]
  before_action :authorise_user, only: %i[new create edit update destroy show]
  before_action :authorise_note, only: %i[edit update destroy]

  def index
    @notes ||= @current_user.notes.all unless @current_user.nil?
  end

  def show
    render_not_found unless @note.present? && @note.user_id == @current_user.id
  end

  def new
    @note = @current_user.notes.new
  end

  def create
    @note = @current_user.notes.new note_params
    if @note.save
      flash[:success] = "Note created"
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @note.update(note_update_params)
    unless @note.valid?
      return redirect_to edit_note_path(@note),
                         alert: @note.errors.full_messages
    end
    redirect_to note_path(@note)
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def authorise_note
    not_found unless @note.user == @current_user
  end

  def set_note
    @note = Note.find_by_id(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :text)
  end

  def note_update_params
    params.require(:note).permit(:title, :text)
  end

end