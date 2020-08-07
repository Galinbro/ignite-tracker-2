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
    @user_course = UserCourse.find_by(course_id: params[:id], user_id: current_user.id)
  end

  def update
    @user_course = UserCourse.find_by(course_id: params[:id], user_id: current_user.id)
    if @user_course.update(user_courses_params)
      flash[:notice] = "Course was updated successfully."
      redirect_to user_courses_path
    else
      render 'edit'
    end
  end

  def new
    @user_course = UserCourse.new
  end
  
  def create
    @user_course = Category.new(user_courses_params)
    if @user_course.save
      flash[:notice] = "Category was successfully created"
      redirect_to @user_course
    else
      render 'new'
    end
  end
  
  def missing
    if params[:topic]
      @topic = Topic.find_by(id: params[:topic])
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic], finished: false), items: 10)
    else
      @topic = Topic.first
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1, finished: false), items: 10)
    end
  end

  def done
    if params[:topic]
      @topic = Topic.find_by(id: params[:topic])
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: params[:topic], finished: true), items: 10)
    else
      @topic = Topic.first
      @pagy, @user_courses = pagy(UserCourse.where(topic_id: 1, finished: true), items: 10)
    end
  end

  def toggle
    @user_course = UserCourse.find_by(course_id: params[:course_id], user_id: current_user.id)
    if @user_course.update(finished: params[:finished])
      flash[:notice] = "Course was updated successfully."
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end
  private

  def user_courses_params
    params.require(:user_course).permit(:finished)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
