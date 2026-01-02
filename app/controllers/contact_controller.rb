class ContactController < ApplicationController
  def create
    data = params.permit(:name, :email, :message)
    Rails.logger.info "New message: #{data}"

    render json: { status: "ok" }
  end
end
