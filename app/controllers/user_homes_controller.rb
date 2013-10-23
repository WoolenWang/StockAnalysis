class UserHomesController < ApplicationController
    before_filter :require_user, :only => [:show,:welcome]
    layout 'user_homes_layout'
    # GET /user_homes
    # GET /user_homes.json
    def index
        @user_home = UserHome.find_by_user_id(current_user.id)
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @user_home.to_json(:include => :layout) }
        end
    end

    def welcome
        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def show
        my_name = current_user.username
        @is_i_can_change = true if my_name == params[:username]
        @page_user = User.find_by_username(params[:username])
	userid = current_user.id unless @page_user
	userid = @page_user.id if @page_user
        logger.debug userid
        @page_user_home = UserHome.find_by_user_id(userid)
        logger.debug @page_user_home.to_json(:include => {:layouts =>{:include => :desktop_icons}})
        respond_to do |format|
            format.html
            format.json { render json: @page_user_home.to_json(:include => {:layouts =>{:include => :desktop_icons}}) }
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
