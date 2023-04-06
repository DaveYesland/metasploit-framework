# -*- coding:binary -*-
require 'spec_helper'


RSpec.describe Rex::Proto::Kerberos::Model::PreAuthPkAsReq do

  subject(:pa) do
    described_class.new
  end

  let(:sample) do
    Base64.decode64('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')
  end

  context "when parsing a PA-PK-AS-REQ" do
    it "parses correctly" do
      result = Rex::Proto::Kerberos::Model::PreAuthPkAsReq.parse(sample)
      # Test an assortment of properties:
      expect(result.signed_auth_pack.signed_data[:version].value).to eq(3)
      expect(result.signed_auth_pack.signed_data[:encap_content_info].econtent[:pk_authenticator][:cusec].value).to eq(680117)
      expect(result.signed_auth_pack.signed_data[:signer_infos].value[0][:signed_attrs][0][:attribute_type].value).to eq('1.2.840.113549.1.9.3')
    end

    it "returns the same value it started with when re-encoding" do
      result = Rex::Proto::Kerberos::Model::PreAuthPkAsReq.parse(sample)
      re_encoded = result.to_der
      expect(re_encoded).to eq(sample)
    end
  end
end
