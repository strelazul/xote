# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new

    # POST /resource/password

    # GET /resource/password/edit?reset_password_token=abcdef

    # PUT /resource/password

    protected

    def after_resetting_password_path_for(_resource)
      root_path
    end

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(_resource_name)
      signin_path
    end
  end
end
