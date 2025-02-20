class Trainer < ApplicationRecord
  has_many :pokeballs, dependent: :destroy
  has_many :pokemons, through: :pokeballs

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :age, presence: true
end
