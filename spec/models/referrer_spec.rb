require 'spec_helper'

describe Referrer do

  describe "Validations" do
    [:token, :url, :hits].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end

    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:token) }

    it { should allow_value("http://rymai.com").for(:url) }
    it { should allow_value("https://rymai.com").for(:url) }
    it { should_not allow_value("-").for(:url) }
  end

  describe ".create_or_update_from_type" do

    it "should create referrer and set contextual_hits to 1 if url/token doesn't exist" do
      expect { Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'c') }.should change(Referrer, :count).by(1)
      Referrer.last.contextual_hits.should eq 1
    end

    it "should increment contextual_hits if referrer url/token already exsits" do
      Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'c')
      Referrer.last.contextual_hits.should eq 1
      expect { Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'c') }.should change(Referrer, :count).by(0)
      Referrer.last.contextual_hits.should eq 2
    end

    it "should create referrer and set badge_hits to 1 if url/token doesn't exist" do
      expect { Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'b') }.should change(Referrer, :count).by(1)
      Referrer.last.badge_hits.should eq 1
    end

    it "should increment badge_hits if referrer url/token already exsits" do
      Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'b')
      Referrer.last.badge_hits.should eq 1
      expect { Referrer.create_or_update_from_type('site_token', 'http://www.bob.com', 'b') }.should change(Referrer, :count).by(0)
      Referrer.last.badge_hits.should eq 2
    end
  end
end
