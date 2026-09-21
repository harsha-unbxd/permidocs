# frozen_string_literal: true

module Authorization
  class PermifyClient
    HOST = 'http://localhost:3476'
    attr_reader(*%i[permission_api data_api])

    HAS_ACCESS = 'CHECK_RESULT_ALLOWED'

    def authorized?(action:, entity:, subject:, tenant:)
      payload = {
        metadata: { schema_version: '', depth: 20, snap_token: '' },
        entity: { type: entity[:name], id: entity[:id].to_s },
        permission: action,
        subject: { type: subject[:name], id: subject[:id].to_s }
      }
      resp = SendApiRequest.call(
        method: :post, url: "#{HOST}/v1/tenants/#{tenant.id}/permissions/check", payload: payload
      )
      Rails.logger.info('couldnt complete the reuqest') if resp[:err].present?
      resp[:err].present? ? false : resp[:body][:can] == HAS_ACCESS
    end

    def sync(role:, entity:, subject:, tenant:)
      tuples = [{
        entity: { type: entity[:name], id: entity[:id].to_s },
        relation: role,
        subject: { type: subject[:name], id: subject[:id].to_s }
      }]
      payload = {
        "metadata": {
          "schema_version": ''
        },
        tuples: tuples
      }
      SendApiRequest.call(
        method: :post, url: "#{HOST}/v1/tenants/#{tenant.id}/data/write", payload: payload
      )
    end
  end
end
