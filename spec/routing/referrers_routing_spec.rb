require 'spec_helper'

describe ReferrersController do
  it { get('c/nln2ofdf').should route_to('referrers#show', type: 'c', site_token: 'nln2ofdf') }
  it { get('b/nln2ofdf').should route_to('referrers#show', type: 'b', site_token: 'nln2ofdf') }
end
