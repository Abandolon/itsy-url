class Url < ApplicationRecord
  belongs_to :user, optional: true
  validates :custom_short, uniqueness: true
end
