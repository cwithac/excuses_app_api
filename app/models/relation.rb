class Relation < ApplicationRecord
  belongs_to :occasion
  belongs_to :excuse

  validates_uniqueness_of :occasion_id, scope: :excuse_id
  # validates_uniqueness_of :excuse_id, scope: :occasion_id
end
