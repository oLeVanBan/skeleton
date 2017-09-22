module AvatarSerializer
  def avatar_thumb_url
    avatar.thumb.present? ? avatar.thumb.url : avatar.default_url
  end

  def avatar_medium_url
    avatar.medium.present? ? avatar.medium.url : avatar.default_url
  end

  def avatar_large_url
    avatar.large.present? ? avatar.large.url : avatar.default_url
  end

  def avatar
    @avatar ||= object.avatar
  end
end
