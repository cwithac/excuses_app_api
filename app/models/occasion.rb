class Occasion < ApplicationRecord
  has_many :relations
  has_many :excuses, through: :relations
end
