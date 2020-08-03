class AddTopicIdToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :topic, null: false, foreign_key: true
  end
end
