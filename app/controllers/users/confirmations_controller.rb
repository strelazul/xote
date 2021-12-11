# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    # GET /resource/confirmation/new

    # POST /resource/confirmation

    # GET /resource/confirmation?confirmation_token=abcdef

    protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for
      new_user_confirmation_path
    end

    # The path used after confirmation.
    def after_confirmation_path_for
      signin_path
    end
  end
end
