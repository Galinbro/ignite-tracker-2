class HomeController < ApplicationController
  def index
  end

  def courses
    @user_courses = UserCourse.all
    if current_user.role == Role.first
      
    end

  end
end
