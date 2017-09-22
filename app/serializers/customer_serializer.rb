class CustomerSerializer < ActiveModel::Serializer
  include BaseSerializer
  include AvatarSerializer

  attributes :id, *(Customer::DEFAULT_PARAMS - [:avatar]),
             :avatar_url, :avatar_thumb_url, :avatar_medium_url, :avatar_large_url
end
