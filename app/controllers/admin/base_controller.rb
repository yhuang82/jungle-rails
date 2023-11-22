class Admin::BaseController < ApplicationController
  before_action :authenticate_admin

  private
  def authenticate_admin
    expected_username = ENV['ADMIN_USERNAME']
    expected_password = ENV['ADMIN_PASSWORD']
    authenticate_or_request_with_http_basic do |username, password|
      username == expected_username && password == expected_password
    end
  end
end
