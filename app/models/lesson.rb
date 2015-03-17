class Lesson < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  belongs_to :course

  before_create :assign_lesson_number

  default_scope {order('lesson_order')}

  def update_lesson_order (new_position)
    old_position = self.lesson_order
    self.lesson_order = new_position
    self.save
    Lesson.all.each do |lesson|
      unless lesson == self
        if lesson.lesson_order >= new_position
          lesson.lesson_order += 1
          lesson.save
        end
        binding.pry
      end
    end
  end

  def next
    Lesson.find_by(lesson_order: self.lesson_order + 1)
  end

  def previous
    Lesson.find_by(lesson_order: self.lesson_order - 1)
  end

  def last_lesson?
    !self.next
  end

  def first_lesson?
    !self.previous
  end


  private
    def assign_lesson_number
      self.lesson_order = (Lesson.all.length + 1)
    end
end
