class NotesController < ApplicationController
  allow_unauthenticated_access

  def index
    @note = Note.new
    @notes = Note.recent
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path, notice: "Note saved."
    else
      @notes = Note.recent
      render :index, status: :unprocessable_content
    end
  end

  private
    def note_params
      params.expect(note: [ :body ])
    end
end
