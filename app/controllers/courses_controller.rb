class CoursesController<ApplicationController
  before_action :find_course, only: [:edit, :update, :show, :destroy]


  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice]='You have successfully saved a course!'
      redirect_to courses_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice]="You have successfully updated #{@lesson.title}!"
      redirect_to courses_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.delete
    flash[:alert]="Successfully deleted!"
    redirect_to courses_path
  end

private
  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
