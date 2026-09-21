class V1::Accounts::PermissionsController < ApplicationController
  def index
    render status: :ok, json: { message: :ok }
  end

  def show
    render status: :ok, json: { message: :ok }
  end

  def update
    render status: :ok, json: { message: :ok }
  end

  def delete
    render status: :ok, json: { message: :ok }
  end

  def create
    @authorization_service.sync(
      relation: params[:relation],
      entity: params[:entity],
      subject: params[:subject]
    )
  end

  private
  def authorization_service
    @authorization_service = Authorization::AuthorizationService.new
  end
end
