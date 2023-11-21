class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find_by(params[:id])
  end
end
