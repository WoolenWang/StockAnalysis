class UserHomesController < ApplicationController
  # GET /user_homes
  # GET /user_homes.json
  def index
    @user_homes = UserHome.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_homes }
    end
  end

  # GET /user_homes/1
  # GET /user_homes/1.json
  def show
    @user_home = UserHome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_home }
    end
  end

  # GET /user_homes/new
  # GET /user_homes/new.json
  def new
    @user_home = UserHome.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_home }
    end
  end

  # GET /user_homes/1/edit
  def edit
    @user_home = UserHome.find(params[:id])
  end

  # POST /user_homes
  # POST /user_homes.json
  def create
    @user_home = UserHome.new(params[:user_home])

    respond_to do |format|
      if @user_home.save
        format.html { redirect_to @user_home, notice: 'User home was successfully created.' }
        format.json { render json: @user_home, status: :created, location: @user_home }
      else
        format.html { render action: "new" }
        format.json { render json: @user_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_homes/1
  # PUT /user_homes/1.json
  def update
    @user_home = UserHome.find(params[:id])

    respond_to do |format|
      if @user_home.update_attributes(params[:user_home])
        format.html { redirect_to @user_home, notice: 'User home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_homes/1
  # DELETE /user_homes/1.json
  def destroy
    @user_home = UserHome.find(params[:id])
    @user_home.destroy

    respond_to do |format|
      format.html { redirect_to user_homes_url }
      format.json { head :no_content }
    end
  end
end
