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
end
