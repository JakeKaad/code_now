class LessonsController <ApplicationController
  before_action :find_lesson, only: [:edit, :update, :show, :destroy]

  def index
    @lessons = Lesson.all
    @courses = Course.all
  end

  def new
    @lesson = Lesson.new
  end

  def show
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice]='You have successfully saved a lesson!'
      redirect_to lessons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      flash[:notice]="You have successfully updated #{@lesson.title}!"
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson.delete
    Lesson.update_lesson_order
    flash[:alert]="Successfully deleted!"
    redirect_to lessons_path
  end

  private

    def find_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :content)
    end

end
