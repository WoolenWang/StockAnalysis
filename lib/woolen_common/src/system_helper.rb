# -*- encoding : utf-8 -*-
module WoolenCommon
    module SystemHelper

        def ruby18?
            RUBY_VERSION =~ /^1.8/ ? true : false
        end

        module_function :ruby18?

        def ruby19?
            RUBY_VERSION =~ /^1.9/ ? true : false
        end

        module_function :ruby19?

        def platform
            case RUBY_PLATFORM
                when /w32/, /mswin32/
                    "windows"
                when /linux/
                    "linux"
                else
                    "mac"
            end
        end

        module_function :platform

        def windows?
            case RUBY_PLATFORM
                when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
                    return true
                else
                    return false
            end
        end

        module_function :windows?

        def is_x64?
            case RUBY_PLATFORM
                when /x86_64/
                    return true
                else
                    return false
            end
        end

        module_function :is_x64?
    end
end
