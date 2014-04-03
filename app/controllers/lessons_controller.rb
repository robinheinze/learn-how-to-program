class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
    render('lessons/index.html.erb')
  end

  def show
    @lesson = Lesson.find(params[:id])
    @next_lesson = @lesson.next
    @previous_lesson = @lesson.previous
    render('lessons/show.html.erb')
  end

  def new
    @lesson = Lesson.new
    @next_lesson_num = Lesson.all.length + 1
    render('lessons/new.html.erb')
  end

  def create
    @lesson = Lesson.new(params[:lessons])
    # Lesson.increment_lessons(@lesson.number)
    if @lesson.save
      redirect_to("/lessons/#{@lesson.id}")
    else
      @next_lesson_num = Lesson.all.length + 1
      render('lessons/new.html.erb')
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    # Lesson.increment_lessons(@lesson.number)
    if @lesson.update(params[:lessons])
      redirect_to("/lessons/#{@lesson.id}")
    else
      @next_lesson_num = Lesson.all.length + 1
      render('lessons/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    render("lessons/destroy.html.erb")
  end



end
