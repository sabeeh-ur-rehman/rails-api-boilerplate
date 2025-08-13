# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ParameterObjects

  before_action :set_current_account
  before_action :set_current_user

  private

  def set_current_account
    subdomain = request.subdomains.first
    Current.account = Account.find_by(subdomain: subdomain) if subdomain.present?
    Current.account ||= Account.first
  end

  def set_current_user
    Current.user = current_user if defined?(current_user)
  end
end
