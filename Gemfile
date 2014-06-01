source 'http://ruby.taobao.org'
ruby '1.9.3'
# 这里使用ruby的版本来区分加载的gem
case RUBY_VERSION
    when /^1\.9\.3/
        # 定义rails的版本
        gem 'rails', '3.2.13'
        # Bundle edge Rails instead:
        # gem 'rails', :git => 'git://github.com/rails/rails.git'

        #gem 'sqlite3','3.7.9'

        # javascript脚本运行
        gem 'jquery-rails', '3.0.4'
        gem 'execjs', '1.4.0'
        gem 'therubyracer', '0.11.4'
        # 用户登陆
        gem 'authlogic', '3.1.0'
        # running server
        gem 'thin', '1.5.1'
        # 人工智能
        gem 'ai4r'
        # 线程池
        gem 'actionpool','0.2.3'


        # Gems used only for assets and not required
        # in production environments by default.
        group :assets do
            gem 'sass-rails', '~> 3.2.3'
            gem 'coffee-rails', '~> 3.2.1'
            # See https://github.com/sstephenson/execjs#readme for more supported runtimes
            # gem 'therubyracer', :platforms => :ruby
            gem 'uglifier', '>= 1.0.3'
        end
        group :test do
            # 测试工具
            gem 'capybara', '2.0.2'
        end
        group :development, :test do
            # 使用Rspec来测试代码
            gem 'rspec-rails', '2.14.0'
            # 使用 guard-rspec来自动测试
            gem 'guard-rspec', '4.2.0'
            # 使用spork来加速自动测试
            gem 'spork', '0.9.2'
            # 使用guard-spork来关联两者
            gem 'guard-spork', '1.5.1'
            # 使用notify来通知, 自动区分各个平台
            case RUBY_PLATFORM
                when /mswin|msys|mingw|cygwin|bccwin|wince|emc/ # 这里是windows，貌似好多种可能的编译器出来的，现在大多都是mingw的了
                    gem 'rb-fchange'
                    gem 'rb-notifu'
                    gem 'win32console'
                when /linux/ # 这里是linux的
                    gem 'rb-inotify', '0.9.3'
                    gem 'libnotify', '0.8.2'
                else # 这里是mac的
                    gem 'rb-fsevent'
                    gem 'growl'
            end
            # 数据库
            gem 'mysql2', '0.3.13'
        end
        group :production do
            # heroku服务器是使用这个gem来作数据库的
            gem 'pg'
        end
    else
        raise '还不支持当前的ruby版本'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
