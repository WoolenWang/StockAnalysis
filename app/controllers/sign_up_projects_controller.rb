class SignUpProjectsController < ApplicationController
  # GET /sign_up_projects
  # GET /sign_up_projects.json
  def index
    @sign_up_projects = SignUpProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sign_up_projects }
    end
  end

  # GET /sign_up_projects/1
  # GET /sign_up_projects/1.json
  def show
    @sign_up_project = SignUpProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sign_up_project }
    end
  end

  # GET /sign_up_projects/new
  # GET /sign_up_projects/new.json
  def new
    @sign_up_project = SignUpProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sign_up_project }
    end
  end

  # GET /sign_up_projects/1/edit
  def edit
    @sign_up_project = SignUpProject.find(params[:id])
  end

  # POST /sign_up_projects
  # POST /sign_up_projects.json
  def create
    @sign_up_project = SignUpProject.new(params[:sign_up_project])

    respond_to do |format|
      if @sign_up_project.save
        format.html { redirect_to @sign_up_project, notice: 'Sign up project was successfully created.' }
        format.json { render json: @sign_up_project, status: :created, location: @sign_up_project }
      else
        format.html { render action: "new" }
        format.json { render json: @sign_up_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sign_up_projects/1
  # PUT /sign_up_projects/1.json
  def update
    @sign_up_project = SignUpProject.find(params[:id])

    respond_to do |format|
      if @sign_up_project.update_attributes(params[:sign_up_project])
        format.html { redirect_to @sign_up_project, notice: 'Sign up project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sign_up_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_up_projects/1
  # DELETE /sign_up_projects/1.json
  def destroy
    @sign_up_project = SignUpProject.find(params[:id])
    @sign_up_project.destroy

    respond_to do |format|
      format.html { redirect_to sign_up_projects_url }
      format.json { head :no_content }
    end
  end
end
