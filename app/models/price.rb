class Price < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :cost, presence: true
  validates :length, presence: true
end
