class Notecollection < ApplicationRecord
  has_and_belongs_to_many :notes
  has_and_belongs_to_many :users
end
