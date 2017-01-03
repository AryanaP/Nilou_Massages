class Partner < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :link, uniqueness: true
  validates :email, uniqueness: true

   has_attachments :photos
end

