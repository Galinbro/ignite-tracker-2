module Chart
  class UsersController < ApplicationController
    def topics
      all = UserCourse.where(user_id: params[:id], topic_id: params[:topic]).count
      mine = UserCourse.where(user_id: params[:id], finished: true, topic_id: params[:topic]).count
      mine_percent = (mine.to_f*100/all).round(0)
      render json: {'Finish' => mine_percent, 'Missing' => 100-mine_percent }
    end
  end
end
