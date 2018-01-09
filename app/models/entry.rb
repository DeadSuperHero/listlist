class Entry < ApplicationRecord
  belongs_to :list
  belongs_to :users
end
