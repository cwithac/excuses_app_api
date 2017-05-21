class Excuse < ApplicationRecord
  has_many :relations
  has_many :occasions, through: :relations
  belongs_to :user
end
