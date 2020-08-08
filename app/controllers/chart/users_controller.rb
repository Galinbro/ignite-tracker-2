module Chart
  class UsersController < ApplicationController
    def topic1
      topics(1)
    end
    def topic2
      topics(2)
    end
    def topic3
      topics(3)
    end
    def topic4
      topics(4)
    end
    def topic5
      topics(5)
    end
    def topic6
      topics(6)
    end
  
    private
    def topics (topic)
      all = UserCourse.where(user_id: current_user.id, topic_id: topic).count
      mine = UserCourse.where(user_id: current_user.id, finished: true, topic_id: topic).count
      mine_percent = (mine.to_f*100/all).round(0)
      render json: {'Finish' => mine_percent, 'Missing' => 100-mine_percent }
    end
  end
end
