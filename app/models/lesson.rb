class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  after_save :increment_lessons

  def next
    lesson = Lesson.find_by(:number => (self.number + 1))
  end

  def previous
    lesson = Lesson.find_by(:number => (self.number - 1))
  end

  def lessons_after
    total = Lesson.all.length
    number = self.number
    Lesson.where(:number => (number..total)) - [self]
  end

  def increment_lessons
    number = self.number
    lessons_after = self.lessons_after
    lessons_after.each do |lesson|
      old_number = lesson.number
      lesson.update(:number => (old_number + 1))
    end
  end

end

