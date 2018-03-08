# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  include BaseSerializer

  attributes :id, :firebase_token, :user_id
end
