class NotecollectionsController < ApplicationController
  before_action :set_notecollection, only: [:show, :edit, :update, :destroy,:newsharing,:createsharing]
before_action :authenticate_user!
  # GET /notecollections
  # GET /notecollections.json
  def index
    if current_user.admin?
        @notecollections = Notecollection.all
    else
    @notecollections = current_user.notecollections
    end
  end

  # GET /notecollections/1
  # GET /notecollections/1.json
  def show
  end

  # GET /notecollections/new
  def new
    @notecollection = Notecollection.new
    @note = current_user.notes
  end

  # GET /notecollections/1/edit
  def edit
    @note = current_user.notes
  end

  # POST /notecollections
  # POST /notecollections.json
  def create
    @notecollection = Notecollection.new(notecollection_params)
    @notecollection.users << current_user
    respond_to do |format|
      if @notecollection.save
        format.html { redirect_to @notecollection, notice: 'Notecollection was successfully created.' }
        format.json { render :show, status: :created, location: @notecollection }
      else
        format.html { render :new }
        format.json { render json: @notecollection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notecollections/1
  # PATCH/PUT /notecollections/1.json
  def update
    respond_to do |format|
      if @notecollection.update(notecollection_params)
        format.html { redirect_to @notecollection, notice: 'Notecollection was successfully updated.' }
        format.json { render :show, status: :ok, location: @notecollection }
      else
        format.html { render :edit }
        format.json { render json: @notecollection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notecollections/1
  # DELETE /notecollections/1.json
  def destroy
    @notecollection.destroy
    respond_to do |format|
      format.html { redirect_to notecollections_url, notice: 'Notecollection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def newsharing
     @user =  current_user.friends - @notecollection.users

     if @user.empty?
        respond_to do |format|
        format.html { redirect_to @notecollection, notice: 'The note has already been shared with all of   your friends' }
        end
    end
   end

     def createsharing
     @notecollection.user_ids = params["users"]["user_ids"] + (@notecollection.users).map{|u| u.id}
     redirect_to @notecollection
     end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notecollection
      @notecollection = Notecollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notecollection_params
      params.require(:notecollection).permit(:name, :comment, :note_ids =>[], :user_ids =>[])
    end

     
end
