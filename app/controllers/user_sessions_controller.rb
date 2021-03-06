# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
    #authenticate_with User
    before_filter :require_no_user, :only => [:new, :create]

    before_filter :require_user, :only => :destroy

    layout 'user_sessions'

    def new
        @user_session = UserSession.new
    end

    def create
        @user_session = UserSession.new(params[:user_session])
        if @user_session.save
            flash[:notice] = 'Login successful!'
            redirect_back_or_default user_home_path(@user_session.username)
        else
            render :action => :new
        end
    end

    def destroy
        current_user_session.destroy
        flash[:notice] = 'Logout successful!'
        redirect_back_or_default new_user_session_url
    end
end

