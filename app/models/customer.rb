class Customer < ApplicationRecord
  DEFAULT_PARAMS = [:store_id, :first_name, :last_name, :gender, :birthday, :phone_number, :career, :address, :avatar]

  mount_uploader :avatar, AvatarUploader

  belongs_to :store

  scope :by_full_name, ->(full_name) { where("CONCAT(LOWER(first_name),' ',LOWER(last_name)) LIKE ?", "%#{full_name.to_s.downcase}%").order(:first_name) }
end
