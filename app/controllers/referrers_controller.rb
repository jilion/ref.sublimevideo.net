class ReferrersController < ActionController::Metal
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::Redirecting
  include ActionController::StrongParameters
  include Rails.application.routes.url_helpers

  # GET /:type/:token
  def show
    Hit.increment(_hit_params)
    _set_referrer_token_in_cookie
  ensure
    redirect_to 'http://sublimevideo.net'
  end
  include ::NewRelic::Agent::Instrumentation::ControllerInstrumentation
  add_transaction_tracer :show

  private

  def _set_referrer_token_in_cookie
    cookies[:r] = {
      value: params[:site_token],
      expires: 1.year.from_now,
      domain: :all,
      secure: false }
  end

  def _hit_params
    params[:hit] = params.slice(:site_token, :type)
    params.require(:hit).permit(:site_token, :type)
  end
end
