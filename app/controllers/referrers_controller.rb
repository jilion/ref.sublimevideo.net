class ReferrersController < ActionController::Metal
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers

  # GET /:type/:token
  def show
    Referrer.create_or_update_from_type(params[:token], request.referer, params[:type])
    set_referrer_token_in_cookie
  ensure
    redirect_to 'http://sublimevideo.net'
  end

private

  def set_referrer_token_in_cookie
    cookies[:r] = {
      value: params[:token],
      expires: 1.year.from_now,
      domain: :all,
      secure: false
    }
  end

end
