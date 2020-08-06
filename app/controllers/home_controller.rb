class HomeController < ApplicationController
  def index
  end

  def courses
    @user_courses = UserCourse.all
  end
end
