require 'rails_helper'

describe Lesson do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  context 'on save' do
    it 'will save the lesson_order with the next highest integer' do
      lesson1 = Lesson.create({:title =>'lesson1', :content =>'xyz'})
      lesson2 = Lesson.create({:title => 'lesson2', :content =>'abc'})
      expect(lesson2.lesson_order).to eq 2
    end
  end

  describe '#next' do
    it "should find the next lesson in lesson_order" do
      lesson1 = Lesson.create({:title =>'lesson1', :content =>'xyz'})
      lesson2 = Lesson.create({:title => 'lesson2', :content =>'abc'})
      expect(lesson1.next).to eq lesson2
    end
  end

  describe '#previous' do
    it "should find the previous lesson in lesson_order" do
      lesson1 = Lesson.create({:title =>'lesson1', :content =>'xyz'})
      lesson2 = Lesson.create({:title => 'lesson2', :content =>'abc'})
      expect(lesson2.previous).to eq lesson1
    end
  end

  # describe '#update_lesson_order' do
  #
  #   it 'should update the lesson order' do
  #     lesson1 = Lesson.create({:title =>'lesson1', :content =>'xyz'})
  #     lesson2 = Lesson.create({:title => 'lesson2', :content =>'abc'})
  #     lesson2.update_lesson_order(1)
  #     expect(lesson2.lesson_order).to eq 1
  #   end
  #
  #   it 'should update other lessons orders' do
  #     lesson1 = Lesson.create({:title =>'lesson1', :content =>'xyz'})
  #     lesson2 = Lesson.create({:title => 'lesson2', :content =>'abc'})
  #     lesson2.update_lesson_order(1)
  #     expect(lesson1.lesson_order).to eq 2
  #   end
  # end
end
