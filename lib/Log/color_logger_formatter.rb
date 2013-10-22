class ColorLoggerFormatter < Logger::Formatter
    SEVERITY_TO_COLOR_MAP = { 'DEBUG' => 'sky', 'INFO' => 'green', 'WARN' => 'yellow', 'ERROR' => 'purple', 'FATAL' => 'red', 'UNKNOWN' => 'blue' }
    WIN_PRINTER = Pathname.new(File.join(__FILE__, '..', '..', 'bin', 'puts_color.exe')).realpath.to_s
    PROJECT_ROOT = Pathname.new(File.join(__FILE__, '..', '..', '..')).realpath.to_s
    LINUX_TIME_FORMAT = "\033[0;37m[%s] \033"
    WINDOWS_TIME_FORMAT = '[ %s ]'
    LINUX_FORMAT = "[%sm %s\e[0m\n"

    def windows?
        case RUBY_PLATFORM
            when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
                return true
            else
                return false
        end
    end

    def format_message(msg, color)
        format_color_message(msg, color)
    end

    def format_color_message(message, color = nil)
        if windows?
            the_color = color || 'default'
            begin
                system("#{WIN_PRINTER} #{the_color} default \"#{message.gsub('"', '\"')}\"")
            rescue Exception => e
                puts e.message
            end
            message
        else
            case color
                when 'red'
                    color = '31;1'
                when 'green'
                    color = '32;1'
                when 'yellow'
                    color = '33;1'
                when 'blue'
                    color = '34;1'
                when 'purple'
                    color = '35;1'
                when 'sky'
                    color = '36;1'
                else
                    color = '36;1'
            end
            LINUX_FORMAT % [color, message]
        end
    end

    # Get the caller find the project file which call the log
    # format the output log
    # only debug use
    def call(severity, time, progname, msg)
        line = ''
        caller.each do |caller_line|
            if caller_line.include? PROJECT_ROOT
                line = caller_line.gsub(PROJECT_ROOT, '')
                break
            end
        end
        line = '' if line == nil or line.include? '/script/'
        unless line.blank?
            _msg = "#{line}:\n#{msg}\n"
        else
            _msg = "#{msg}"
        end
        return '' if _msg == '' or _msg == "\n"
        color = SEVERITY_TO_COLOR_MAP[severity]
        if windows?
            time_str = WINDOWS_TIME_FORMAT % [time.to_s(:short)]
        else
            time_str = LINUX_TIME_FORMAT % [time.to_s(:short)]
        end
        time_str + format_message(severity + ' - ' + _msg, color)
    end
end