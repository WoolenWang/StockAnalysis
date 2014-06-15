# -*- encoding : utf-8 -*-
require 'woolen_common/woolen_common'
class ApplicationController < ActionController::Base
    include WoolenCommon::ToolLogger
    protect_from_forgery
    helper_method :current_user_session, :current_user, :render_success_json, :render_success_msg, :render_fail_msg

    private
    def current_user_session
        logger.debug 'ApplicationController::current_user_session'
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find

    end

    def current_user
        logger.debug 'ApplicationController::current_user'
        #logger.debug 'CurrentUser is ' + @current_user.username if defined?(@current_user)
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.user
        logger.debug 'CurrentUser is ' + @current_user.username if (@current_user)
    end

    def require_user
        logger.debug 'ApplicationController::require_user'
        unless current_user
            store_location
            flash[:notice] = '你必须退出登录访问这个页面！'
            redirect_to new_user_session_url
            return false
        end
    end

    def require_no_user
        logger.debug 'ApplicationController::require_no_user'
        if current_user
            store_location
            flash[:notice] = '你必须退出登录访问这个页面！'
            redirect_to :controller => 'user_homes', :action => 'show'
            return false
        end

    end

    def store_location
        session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
    end

    def render_success_json(data, extern_hash = {})
        return_json = {}
        return_json['success'] = true
        return_json['data'] = data
        return_json.merge! extern_hash if extern_hash != {}
        debug "the need to return success json::#{return_json}"
        render :json => return_json
    end

    def render_success_msg(msg, extern_hash={})
        return_json = {}
        return_json['success'] = true
        return_json['msg'] = msg
        debug "the need to return success msg json::#{return_json}"
        render :json => return_json
    end

    def render_fail_msg(msg, extern_hash={})
        return_json = {}
        return_json['success'] = false
        return_json['msg'] = msg
        return_json.merge! extern_hash if extern_hash != {}
        debug "the need to return fail json::#{return_json}"
        render :json => return_json
    end
end

