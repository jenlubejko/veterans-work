class Quote < ApplicationRecord
  belongs_to :company
  belongs_to :customer
end
