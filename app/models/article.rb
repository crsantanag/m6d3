class Article < ApplicationRecord
  belongs_to :location

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions  # or comments doesn't matter

  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = { "like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral" }.freeze

  validates :title,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..50, message: "debe tener entre 2 y 100 caracteres" }

  validates :description,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "debe tener entre 2 y 1000 caracteres" }
end
