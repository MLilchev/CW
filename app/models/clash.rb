class Clash < ApplicationRecord
  belongs_to :conflicts, optional: true
end
