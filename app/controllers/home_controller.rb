class HomeController < ApplicationController 
  def index
  end

  def courses
    
    if params[:topic]
      @topic = Topic.find_by(id: params[:topic])
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic]), items: 10)
    else
      @topic = Topic.first
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1), items: 10)
    end
  end
end
