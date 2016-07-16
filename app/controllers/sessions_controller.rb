class SessionsController < ActionController::Base

  def create
    user = User.from_omniauth(auth_hash)
    session[:current_user_id] = auth_hash['uid']
    # session[:current_user_hash] = auth_hash["info"]["user"]
    session[:current_user_access_token] = auth_hash['credentials']['token']
    redirect_to root_url
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end