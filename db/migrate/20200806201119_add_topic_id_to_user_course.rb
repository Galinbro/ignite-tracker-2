class AddTopicIdToUserCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_courses, :topic, null: true, foreign_key: true
  end
end
