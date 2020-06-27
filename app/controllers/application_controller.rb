class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :who_can_follow

  def who_can_follow
    @can_follow_user = User.where('id != ?', current_user.id).sample(3)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account, :nickname])
  end
end
