# -*- encoding : utf-8 -*-
require "#{File.join(File.dirname(__FILE__), 'logger')}"
module WoolenCommon
    class SshProxy
        include ToolLogger

        def initialize(host, user, options={})
            @host = host
            @user = user
            @options = options
            @conn_retry = options[:proxy_conn_retry] || 5
            @conn_timeout = options[:proxy_conn_timeout] || 30
            proxy_reset_conn
        end

        def proxy_reset_conn
            @conn_retry.times do
                begin
                    Timeout.timeout(@conn_timeout) do
                        @ssh_conn = Net::SSH.start(@host, @user, @options)
                        return
                    end
                rescue Exception => e
                    error "连接ssh服务器出错~!信息是:#{e.message}"
                end
            end
        end

        def method_missing(name, *args, &block)
            if check_connector_close
                @ssh_conn.close rescue nil
                proxy_reset_conn
            end
            debug "SshProxy need to invoke methdo ::#{name} "
            debug "params::#{args}"
            Timeout.timeout(@conn_timeout) do
                return_result = @ssh_conn.send(name, *args, &block)
                debug "SshProxy invoke result ::#{return_result}"
                return return_result
            end
        end

        def check_connector_close
            begin
                if @ssh_conn.nil? or @ssh_conn.closed?
                    return false
                end
                Timeout.timeout(@conn_timeout) do
                    if @ssh_conn.exec!('echo hello').include? 'hello'
                        return true
                    end
                end
            rescue Exception => e
                error "检查连接出错，错误信息是：：#{e.message}"
                return false
            end
            false
        end

        # 阻塞性下载
        def sftp_download!(remote_path, local_path)
            if check_connector_close
                @ssh_conn.close rescue nil
                proxy_reset_conn
            end
            @ssh_conn.sftp.connect! do |sftp_session|
                return sftp_session.download!(remote_path, local_path)
            end
        end

        # 非塞性下载
        def sftp_download(remote_path, local_path)
            if check_connector_close
                @ssh_conn.close rescue nil
                proxy_reset_conn
            end
            @ssh_conn.sftp.connect do |sftp_session|
                return sftp_session.download!(remote_path, local_path)
            end
        end

        def sftp_upload!(remote_path, local_path)
            if check_connector_close
                @ssh_conn.close rescue nil
                proxy_reset_conn
            end
            @ssh_conn.sftp.connect! do |sftp_session|
                return sftp_session.upload!(remote_path, local_path)
            end
        end

        def sftp_upload(remote_path, local_path)
            if check_connector_close
                @ssh_conn.close rescue nil
                proxy_reset_conn
            end
            @ssh_conn.sftp.connect do |sftp_session|
                return sftp_session.upload!(remote_path, local_path)
            end
        end
    end
end
