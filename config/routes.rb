RefSublimeVideo::Application.routes.draw do
  match '/' => redirect('http://sublimevideo.net')

  get '/:type/:token' => 'referrers#show', type: /b|c/, token: /[a-z0-9]{8}/
end
