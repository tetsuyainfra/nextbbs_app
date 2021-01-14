ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in(user)
    if defined?(:login_as)
      #use warden helper
      login_as(user, :scope => :user)
    else #controller_test, model_test
      #use devise helper
      sign_in(user)
    end
  end
  def log_out(scope = :user)
    if defined?(:login_as)
      #use warden helper
      logout(scope)
    else #controller_test, model_test
      #use devise helper
      sign_out scope
    end
  end
end
if ENV.fetch("LOG_OUTPUT_CONSOLE", false)
   # ログをコンソールに出力する
   Rails.logger = Logger.new(STDOUT) # 追記
   # SQLのログ
   # ActiveRecord::Base.logger = Logger.new(STDOUT) # 追記
end
