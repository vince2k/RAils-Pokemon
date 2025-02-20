class Pokemon < ApplicationRecord
  has_many :pokeballs, dependent: :destroy
  has_many :trainers, through: :pokeballs

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :element_type, presence: true
end
