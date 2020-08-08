class HomeController < ApplicationController 
  def index
    # @key_map = {1 => "Technical", 2 => "Practical", 3 => "Soft Skill", 4 => "Atos Training", 5 => "project", 6 => "Other"}
    if current_user.role.id == 1
      @user = User.find_by(email: current_user.email)
      @percent = (UserCourse.where(user_id: current_user.id, finished: true ).count.to_f / Course.all.count * 100).round(2)
    elsif current_user.role.id == 2
      @users = User.all
    else
      @users = User.all
    end
    # User.find_by(email: current_user.email).courses.select { |x| x.topic_id == 6 }
  end

  def show
    @key_map = {1 => "Technical", 2 => "Practical", 3 => "Soft Skill", 4 => "Atos Training", 5 => "project", 6 => "Other"}
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
