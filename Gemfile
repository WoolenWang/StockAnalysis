source 'http://ruby.taobao.org'
ruby '1.9.3'
gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3','3.7.9'

# javascript脚本运行
gem 'jquery-rails','3.0.4'
gem 'execjs','1.4.0'
gem 'therubyracer','0.11.4'
# 用户登陆
gem 'authlogic','3.1.0'
# running server
gem 'thin', '1.5.1'


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
    gem 'capybara','2.0.2'
end
group :development,:test do
    # 使用Rspec来测试代码
    gem 'rspec-rails', '2.14.0'
    # 数据库
    gem 'mysql2', '0.3.13'
end
group :production do
    # 使用Rspec来测试代码
    gem 'pg'
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
