class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :reactions, dependent: :destroy

  validates :content,
  presence: { message: "No puede estar vacío" },
  length: { in: 2..1000, message: "debe tener entre 2 y 1000 caracteres" }
end
