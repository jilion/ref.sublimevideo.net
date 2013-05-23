RefSublimeVideo::Application.routes.draw do
  get '/' => redirect('http://sublimevideo.net')
  get '/:type/:site_token' => 'referrers#show', type: /b|c/, site_token: /[a-z0-9]{8}/
end
