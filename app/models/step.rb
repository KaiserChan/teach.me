class Step < ApplicationRecord
  belongs_to :chapter
  has_many :users
end