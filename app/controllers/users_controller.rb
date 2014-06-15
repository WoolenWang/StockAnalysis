# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
    before_filter :require_no_user, :only => [:new, :create]

    before_filter :require_user, :only => [:show, :edit, :update]

    layout 'extjs'

    def new
        @user = User.new
    end

    def create
        @user = User.find_by_username(params[:user][:username])
        if @user
            render_fail_msg 'Account already registered!'
        elsif params[:user][:password] != params[:user][:password_confirmation]
            render_fail_msg '密码不一致'
        else
            params[:user][:encrypted_passwd] = Digest::MD5.hexdigest(params[:user][:password])
            params[:user].delete :password
            params[:user].delete :password_confirmation
            @user = User.new(params[:user])
            debug "#{@user.username},#{@user.encrypted_passwd}"
            begin
                @user.save!
                @current_user = @user
                render_success_msg 'SuccessFully registered!!'
            rescue => e
                render_fail_msg e.message
            end
        end
    end

    def show
        @user = @current_user
    end

    def edit
        @user = @current_user
    end

    def update
        @user = @current_user # makes our views "cleaner" and more consistent
        params[:user][:encrypted_passwd] = Digest::MD5.hexdigest(params[:user][:password])
        params[:user].delete :password
        params[:user].delete :password_confirmation
        if @user.update_attributes(params[:user])
            flash[:notice] = "Account updated!"
            redirect_to account_url
        else
            render :action => :edit
        end

    end
end

