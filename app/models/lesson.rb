class Lesson < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  before_create :assign_lesson_number

  default_scope {order('lesson_order')}

  def update_lesson_order (new_position)
    self.lesson_order = new_position
    self.save
  end


  private
    def assign_lesson_number
      self.lesson_order = (Lesson.all.length + 1)
    end
end
