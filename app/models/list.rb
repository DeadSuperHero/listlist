class List < ApplicationRecord
  belongs_to :users
  has_many :entries
end
