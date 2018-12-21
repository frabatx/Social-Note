class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy,:newsharing,:createsharing]
  before_action :authenticate_user!
  # GET /notes
  # GET /notes.json
  def index
    if current_user.admin?
         @notes = Note.all
   else
    @notes = current_user.notes
  end
 end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.users << current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully createdviao.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def newsharing
     @user = current_user.friends - @note.users

     if @user.empty?
        respond_to do |format|
        format.html { redirect_to @note, notice: 'The note has already been shared with all of   your friends' }
        end
    end
   end

     def createsharing
     @note.user_ids = params["users"]["user_ids"] + (@note.users).map{|u| u.id}
     redirect_to @note
     end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:text,:image)
    end

end
