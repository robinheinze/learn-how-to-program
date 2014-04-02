class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true


  def next
    lesson = Lesson.find_by(:number => (self.number + 1))
  end

  def previous
    lesson = Lesson.find_by(:number => (self.number - 1))
  end

  def self.lessons_after(number)
    total = Lesson.all.length
    Lesson.where(:number => (number..total))
  end

  def self.increment_lessons(number)
    lessons_after = Lesson.lessons_after(number)
    lessons_after.each do |lesson|
      old_number = lesson.number
      lesson.update(:number => (old_number+ 1))
    end
  end

end

