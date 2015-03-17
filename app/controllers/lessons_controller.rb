class LessonsController <ApplicationController

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(params.require(:lesson).permit(:title, :content))
    if @lesson.save
      flash[:notice]='You have successfully saved a lesson!'
      redirect_to lessons_path
    else
      render :new
    end
  end

  


end
