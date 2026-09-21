# frozen_string_literal: true

module Authorization
  class AuthorizationService
    attr_reader :client

    DEFAULT_AUTHORIZATION_SERVICE = Authorization::PermifyClient

    def initialize(client: DEFAULT_AUTHORIZATION_SERVICE.new)
      @client = client
    end

    def authorized?(action:, entity:, subject:, tenant:)
      @client.authorized?(action: action, entity: entity, subject: subject, tenant: tenant)
    end

    def sync(role:, entity:, subject:, tenant:)
      @client.sync(role: role, entity: entity, subject: subject, tenant: tenant)
    end
  end
end
