# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SimpleShoppingSite::Application.initialize!

ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  authentication:       :plain,
  user_name:            'devnul123qwe',
  password:             'zxcvbnm,./_',
  domain:               'heroku.com',
  enable_starttls_auto: true
}