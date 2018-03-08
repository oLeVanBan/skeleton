# frozen_string_literal: true

shared_context "prepare for user auth" do
  let(:current_user) { FactoryGirl.create :user }
  let(:headers) do
    {
      "X-User-Id" => current_user.user_id,
      "X-Token" => Digest::MD5.hexdigest("#{current_user.user_id}_TS_CLX_9a84e1c4-2501-4e0b-955d-a666f172c679"),
      "X-Firebase-Token" => "GfTTObQhIp46D5pzakfk_ARJt0KdBiBQS6aeVIoyIykwLjAbxq6Td65PNmWyqqHP5w8gGoABW06kwY9YBYwLYJoQ",
    }
  end
end
