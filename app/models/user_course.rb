class UserCourse < ApplicationRecord 
  include Pagy::Search
  belongs_to :user
  belongs_to :course
  belongs_to :topic
  after_create :create_associations
  
  def create_associations
    # myass = MyAssociation.new
    # myass.mymodel_id = self.id
    # myass.save
    self.topic_id = self.course.topic.id;
    #self.topic_id = 1;
    self.save
  end
  
end
