class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_tenant, if: :set_tenant_defined?
  def authorized?(entity: {}, subject: {})
    # calling permify service here for checkign the authentication
    auth = Authorization::AuthorizationService.new
    auth.authorized?(
      action: action_name,
      entity: entity,
      subject: subject,
      tenant: @tenant
    )
  end

  def set_tenant_defined?
    unless defined?(:set_tenant)
      Rails.logger.warn('set tenant is not defined for the current controller', controller_name, action_name)
      return false
    end
    true
  end
end
