class List < ApplicationRecord
  belongs_to :users, optional: true
  has_many :entries
end
