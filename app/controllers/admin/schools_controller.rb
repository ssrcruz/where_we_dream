class Admin::SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  def index
    @schools = School.search(params[:search])
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        redirect_to @school, notice: 'School was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        redirect_to @school, notice: 'School was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    respond_to do |format|
      redirect_to schools_url, notice: 'School was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :scholarship, :rating)
    end
end
