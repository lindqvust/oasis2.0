# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false


config.action_mailer.raise_delivery_errors = true

# set delivery method to :smtp, :sendmail or :test
config.action_mailer.delivery_method = :smtp

# these options are only needed if you choose smtp delivery
config.action_mailer.smtp_settings = {
  :tls => true,

  :address        => 'smtp.gmail.com',
  :port           => 587,
  :domain => "oasis.com",
  :authentication => :plain,
  :user_name => "slu.oasis@gmail.com",
  :password =>"oasis123"  
}

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.ssl?
    "#{request.protocol}#{request.host_with_port}"
  end
}
