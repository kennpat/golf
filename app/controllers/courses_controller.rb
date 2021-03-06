class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @courses = Course.all || []
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      flash[:notice] = "Course created successfully!"
      redirect_to course_path(@course)
    else
      flash[:notice] = "Error(s) prevented course from being created"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @location = [[@course.latitude, @course.longitude]]
    @new_tee = Tee.new
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :street_address,
      :city,
      :state,
      :zip_code,
      :user_id,
      :phone
    )
  end
end
