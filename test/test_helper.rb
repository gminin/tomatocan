ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'fileutils'
require 'carrierwave/storage/fog'


class ActiveSupport::TestCase
  fixtures :all
  # Carrierwave setup and teardown
  carrierwave_template = Rails.root.join('test','fixtures','files')
  carrierwave_root = Rails.root.join('test','support','carrierwave')

  # Carrierwave configuration is set here instead of in initializer
  CarrierWave.configure do |config|
    #    config.storage = :file
    #    config.root = "#{Rails.root}/tmp"
    #    config.cache_dir = "#{Rails.root}/tmp/images"
        config.fog_credentials = { 
          :provider               => 'AWS',
          :aws_access_key_id      => AWS_KEY,
          :aws_secret_access_key  => AWS_SECRET_KEY, 
          :persistent             => false,
          :region             => 'us-east-1'
        }
        config.storage = :fog
        config.permissions = 0777
        config.fog_directory  => AWS_BUCKET
        config.fog_public     = true
        config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    end

  # And copy carrierwave template in
  #puts "Copying\n  #{carrierwave_template.join('uploads').to_s} to\n  #{carrierwave_root.to_s}"
  FileUtils.cp_r carrierwave_template.join('uploads'), carrierwave_root  


  at_exit do
  #puts "Removing carrierwave test directories:"
  Dir.glob(carrierwave_root.join('*')).each do |dir|
    #puts "   #{dir}"
    FileUtils.remove_entry(dir)
  end
  end

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, options = {})
    password    = options[:password]    || 'user123'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       user.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      session[:user_id] = 1 # user.id
    end
  end

  private

  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end
end

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end

