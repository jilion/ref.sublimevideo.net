require 'spec_helper'

describe HitsController do
  it { get('c/nln2ofdf').should route_to('hits#show', type: 'c', site_token: 'nln2ofdf') }
  it { get('b/nln2ofdf').should route_to('hits#show', type: 'b', site_token: 'nln2ofdf') }
end
