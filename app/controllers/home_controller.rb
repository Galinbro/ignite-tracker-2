class HomeController < ApplicationController 
  def index
    if current_user.role.id == 1
      @user = User.find_by(email: current_user.email)
    elsif current_user.role.id == 2
      @users = User.all
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  # def courses
    
  #   if params[:topic]
  #     @topic = Topic.find_by(id: params[:topic])
  #     @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic]), items: 10)
  #   else
  #     @topic = Topic.first
  #     @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1), items: 10)
  #   end
  # end
end
