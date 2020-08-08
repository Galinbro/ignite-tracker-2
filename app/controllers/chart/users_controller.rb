module Chart
  class UsersController < ApplicationController
    def topic1
      all = UserCourse.where(user_id: current_user.id, topic_id: 1).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 1).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
    def topic2
      all = UserCourse.where(user_id: current_user.id, topic_id: 2).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 2).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
    def topic3
      all = UserCourse.where(user_id: current_user.id, topic_id: 3).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 3).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
    def topic4
      all = UserCourse.where(user_id: current_user.id, topic_id: 4).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 4).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
    def topic5
      all = UserCourse.where(user_id: current_user.id, topic_id: 5).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 5).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
    def topic6
      all = UserCourse.where(user_id: current_user.id, topic_id: 6).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: 6).count
      render json: {'finish' => mine, 'missing' => all-mine }
    end
  
  end
end
