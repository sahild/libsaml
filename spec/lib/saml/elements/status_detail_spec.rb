require 'spec_helper'

describe Saml::Elements::StatusDetail do
  let(:status_detail) { FactoryGirl.build(:status_detail) }

  describe "status_value" do
    describe "parse" do
      let(:status_detail_xml) { File.read(File.join('spec', 'fixtures', 'logout_response.xml')) }
      let(:status_detail) { Saml::Elements::StatusDetail.parse(status_detail_xml, :single => true) }

      it "should parse the StatusDetail" do
        status_detail.should be_a(Saml::Elements::StatusDetail)
      end

      it "should parse the value" do
        status_detail.status_value.should == 'foo_status_value'
      end
    end
  end
end
