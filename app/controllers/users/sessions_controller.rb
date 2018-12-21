class Users::SessionsController < Devise::SessionsController
before_action :set_user, only: [:show, :edit, :update, :destroy,:addfriend,:acceptfriend,:revokefriend]
before_action :authenticate_user!
  # GET /users
  # GET /users.json
  def index
     @users = User.all - [current_user]
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def addfriend
    current_user.friendships << User.find(params["id"]).inverse_friendships.create
    respond_to do |format|
    format.html { redirect_to @user, notice: 'made new friends.' }
    end
 end



 def acceptfriend
    current_user.confirm_friend(@user)
    respond_to do |format|
    format.html { redirect_to @user, notice: 'Friendship accepted.' }
    end
 end

 def revokefriend
    friendship = Friendship.find_by(user_id:current_user,friend_id:@user)
    reverse_friendship = Friendship.find_by(user_id:@user,friend_id:current_user)
    if friendship
        Friendship.destroy(friendship.id)
    else
        Friendship.destroy(reverse_friendship.id)
    end
    respond_to do |format|
    format.html { redirect_to @user, notice: 'Friendship accepted.' }
    end
 end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:admin)
    end
end
