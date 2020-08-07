class UserCoursesController < ApplicationController
  def index
    if params[:topic]
      @topic = Topic.find_by(id: params[:topic])
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic]), items: 10)
    else
      @topic = Topic.first
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1), items: 10)
    end
  end

  def edit
  end

  def update
    if @user_courses.update(user_courses_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def new
    @user_courses = UserCourse.new
  end
  
  def create
    @user_courses = Category.new(user_courses_params)
    if @user_courses.save
      flash[:notice] = "Category was successfully created"
      redirect_to @user_courses
    else
      render 'new'
    end
  end

  def missing
    if params[:topic]
      @topic = Topic.find_by(id: params[:topic])
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic]), items: 10)
    else
      @topic = Topic.first
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1, finished: false), items: 10)
    end
  end


  private

  def user_courses_params
    params.require(:user_courses).permit(:user_id, :course_id, :topic_id, :finished)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
