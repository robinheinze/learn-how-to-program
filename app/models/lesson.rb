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

end

