class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :read_last_name, :read_first_name, :birth_date])
  end
end
