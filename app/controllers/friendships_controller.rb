class FriendshipsController < ApplicationController

     before_action :authenticate_user!
     before_action :check_if_admin
  # GET /notes
  # GET /notes.json
  def index
   @friendships = Friendship.all
 end


  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    Friendship.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
protected
  def check_if_admin
  if !current_user.admin?
    redirect_to root_path
  end
end
end
