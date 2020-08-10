class AdminUsersController < ApplicationController 
  before_action :set_user, only: [:edit, :update]

  def index
    if params[:role_id]
      @role = Role.find_by(id: params[:role_id])
      @pagy, @users = pagy(User.where(role_id: params[:role_id]), items: 10)
    else
      @role = Role.find_by(id: 1)
      @pagy, @users = pagy(User.where(role_id: 1), items: 10)
    end
  end

  def edit
    
  end
  
  def update
    
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully."
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private
   
   # Use callbacks to share common setup or constraints between actions.
   def set_user
      @user = User.find(params[:id])
   end
   
   # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
      params.require(:user).permit(:role_id)
   end
end
