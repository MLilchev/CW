class Conflict < ApplicationRecord
  has_many :clashes
  belongs_to :countries, optional: true
end
