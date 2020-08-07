class AddFinishToUserCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :user_courses, :finished, :boolean, :null => false, :default => false
    add_column :user_courses, :date_finished, :datetime, :null => true
  end
end
