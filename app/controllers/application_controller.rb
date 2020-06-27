class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :who_can_follow

  def who_can_follow
    # https://coderwall.com/p/i34iza/rails-quick-tips-random-records
    @can_follow_user = User.can_followed_user(current_user)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account, :nickname])
  end
end
