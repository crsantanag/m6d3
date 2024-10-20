class Article < ApplicationRecord
  belongs_to :user      # Para saber quién crea el artículo
  belongs_to :location  # Para saber dónde se hizo el artículo

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions  # or comments doesn't matter

  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = { "like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral" }.freeze

  validates :title,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..100, message: "debe tener entre 2 y 100 caracteres" }

  validates :description,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "debe tener entre 2 y 1000 caracteres" }

  def likes_count
    reactions.where(kind: "like").count
  end

  def dislikes_count
    reactions.where(kind: "dislike").count
  end

  def not_interested_count
    reactions.where(kind: "not_interested").count
  end

  def neutral_count
    reactions.where(kind: "neutral").count
  end
end
