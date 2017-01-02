class Price < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :length, presence: true
end
