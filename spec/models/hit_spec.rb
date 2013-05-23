require 'spec_helper'

describe Hit do
  describe "Validations" do
    it { should validate_presence_of(:site_token) }
    it { should validate_uniqueness_of(:site_token) }
  end

  describe ".increment" do
    let(:attributes) { { 'site_token' => 'site_token', 'type' => 'c' } }

    context "hit doesn't exist yet" do
      it "creates hit and increments type" do
        expect { Hit.increment(attributes) }.to change(Hit, :count).by(1)
        Hit.last.contextual.should eq 1
      end
    end

    context "hit exists" do
      before { Hit.increment(attributes) }

      it "creates hit and increments type" do
        expect { Hit.increment(attributes) }.to change(Hit, :count).by(0)
        Hit.last.contextual.should eq 2
      end
    end
  end
end

# == Schema Information
#
# Table name: hits
#
#  badge      :integer          default(0)
#  contextual :integer          default(0)
#  created_at :datetime
#  id         :integer          not null, primary key
#  site_token :string(255)
#  updated_at :datetime
#
# Indexes
#
#  index_hits_on_site_token  (site_token) UNIQUE
#

