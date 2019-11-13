class Domain < ApplicationRecord
  has_many :courses, dependent: :destroy
end
