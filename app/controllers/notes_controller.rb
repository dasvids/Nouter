class NotesController < ApplicationController
  before_action :set_note, only: [:show]

  def index
    @notes = Note.all
  end

  def show
    render_not_found unless @note
  end

  private

  def set_note
    @note = Note.find_by_id(params[:id])
  end
end