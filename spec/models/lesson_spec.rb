require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :number }

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :number => 1, :content => 'test content'})
      next_lesson = Lesson.create({:name => 'lesson2', :number => 2, :content => 'test content'})
      current_lesson.next.should eq next_lesson
    end
  end

  context '#previous' do
    it 'returns the lesson with the next-lowest number than the current lesson' do
      previous_lesson = Lesson.create({:name => 'lesson1', :number => 1, :content => 'test content'})
      current_lesson = Lesson.create({:name => 'lesson2', :number => 2, :content => 'test content'})
      current_lesson.previous.should eq previous_lesson
    end
  end

  context '#lessons_after' do
    it 'increments the numbers of lessons that come after the given number' do
      lesson1 = Lesson.create({:name => 'lesson1', :number => 1, :content => 'test content'})
      lesson2 = Lesson.create({:name => 'lesson2', :number => 2, :content => 'test content'})
      lesson3 = Lesson.create({:name => 'lesson3', :number => 3, :content => 'test content'})
      lesson1.lessons_after.should eq [lesson2, lesson3]
    end
  end

   context '#increment_lessons' do
    it 'increments the numbers of lessons that come after the given number' do
      lesson1 = Lesson.create({:name => 'lesson1', :number => 1, :content => 'test content'})
      lesson2 = Lesson.create({:name => 'lesson2', :number => 2, :content => 'test content'})
      lesson3 = Lesson.create({:name => 'lesson3', :number => 3, :content => 'test content'})
      lesson4 = Lesson.create({:name => 'lesson4', :number => 2, :content => 'test content'})
      lesson2.reload.number.should eq 3
    end
  end



end
