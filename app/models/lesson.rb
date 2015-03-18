class Lesson < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content
  belongs_to :course

  before_create :assign_lesson_number

  default_scope { order('lesson_order') }

  def update_given_lesson_order (new_position)
    old_position = self.lesson_order
    self.lesson_order = new_position
    self.save
    Lesson.all.each do |lesson|
      unless lesson == self
        if less_or_equal_to_new_position?(lesson, new_position) && greater_than_old_position?(lesson, old_position)
          lesson.lesson_order += 1
          lesson.save
        end
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

  def self.update_lesson_order
    interval = 1
    Lesson.all.each do |lesson|
      lesson.lesson_order = interval
      lesson.save
      interval += 1
    end
  end

  private
    def assign_lesson_number
      self.lesson_order = (Lesson.all.length + 1)
    end

    def less_or_equal_to_new_position?(lesson, new_position)
      lesson.lesson_order >= new_position
    end

    def greater_than_old_position?(lesson, old_position)
      lesson.lesson_order < old_position
    end
end
