require 'spec_helper'

describe ReferrersController do

  describe "GET redirect" do
    before { Referrer.stub(:create_or_update_from_type) }

    it "calls Referrer.create_or_update_from_type" do
      controller.request.stub(:referer).and_return('http://domain.com')
      Referrer.should_receive(:create_or_update_from_type).with('12345678', 'http://domain.com', 'c')
      get :show, token: '12345678', type: 'c'
    end

    it "sets r cookie" do
      get :show, token: '12345678', type: 'c'
      cookies[:r].should eq '12345678'
    end

    it "redirects to root" do
      get :show, token: '12345678', type: 'c'

      response.should redirect_to('http://sublimevideo.net')
    end

  end

end
