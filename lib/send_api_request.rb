# frozen_string_literal: true

class SendApiRequest
  SUCCESS_CODE = 200
  def self.call(method:, url:, payload: {})
    response = RestClient::Request.execute(method: method, url: url, payload: payload.to_json)
    JSON.parse(response.body)
    { code: SendApiRequest::SUCCESS_CODE, body: JSON.parse(response.body).with_indifferent_access, err: nil }
  rescue RestClient::ExceptionWithResponse => e
    { code: e.http_code, body: JSON.parse(response.http_body).with_indifferent_access, err: e.message }
  end
end
