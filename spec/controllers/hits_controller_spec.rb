require 'spec_helper'

describe HitsController do

  describe "GET redirect" do
    before { Hit.stub(:increment) }

    it "calls Referrer.increment" do
      Hit.should_receive(:increment).with('site_token' => '12345678', 'type' => 'c')
      get :show, site_token: '12345678', type: 'c'
    end

    it "sets r cookie" do
      get :show, site_token: '12345678', type: 'c'
      cookies[:r].should eq '12345678'
    end

    it "redirects to root" do
      get :show, site_token: '12345678', type: 'c'
      response.should redirect_to('http://sublimevideo.net')
    end
  end

end
