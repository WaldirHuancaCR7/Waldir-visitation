class PollDerivation < ApplicationRecord
  belongs_to :derivation
  belongs_to :poll
end
