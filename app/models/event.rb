class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

   has_attachments :photos
end

