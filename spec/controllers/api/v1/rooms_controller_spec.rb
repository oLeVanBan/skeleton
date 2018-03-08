# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::RoomsController, type: :request do
  include_context "prepare for user auth"

  let(:json) { JSON.parse response.body }

  describe "GET #index" do
    let(:request_headers) { headers }
    subject { get api_v1_rooms_path, params: { last_id: 2, limit: 20 }, headers: request_headers }
    it "returns http success", autodoc: true do
      subject
      expect(response).to have_http_status(:ok)
      expect(json.to_s).to eq "{}"
      expect { subject }.not_to change { User.count }
    end
    it "should error" do
      request_headers["X-User-Id"] = 12_345
      request_headers["X-Token"] = "ABC"
      subject
      expect(response).to have_http_status(:unauthorized)
      expect { subject }.not_to change { User.count }
    end
    it "should create new user" do
      request_headers["X-User-Id"] = 12_345
      request_headers["X-Token"] = Digest::MD5.hexdigest "12345_TS_CLX_9a84e1c4-2501-4e0b-955d-a666f172c679"
      expect { subject }.to change { User.count }.from(1).to(2)
    end
    it "should update new firebase_token" do
      request_headers["X-Firebase-Token"] = "ffeeb24e-0ddd-4092-a594-a6925104e14f"
      subject
      expect(current_user.reload.firebase_token).to eq "ffeeb24e-0ddd-4092-a594-a6925104e14f"
    end
  end
end
