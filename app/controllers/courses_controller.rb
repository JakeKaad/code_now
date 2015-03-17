class CoursesController<ApplicationController

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

private
  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
