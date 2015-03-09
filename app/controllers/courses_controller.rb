class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @user = @course.users.find_by(id: current_user)
  end

  def new
    @course = Course.new
    @course.owner = current_user
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)
    @course.owner = current_user

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_path
  end

  def subscribe
    @course = Course.find(params[:id])
    @course.users << current_user

    redirect_to @course
  end

  def unsubscribe
    @course = Course.find(params[:id])
    @user = @course.users.find(current_user)
    if @user
      @course.users.delete(@user)

      redirect_to @course
    end
  end

  private
  def course_params
    params.require(:course).permit(:owner, :name, :description)
  end
end
