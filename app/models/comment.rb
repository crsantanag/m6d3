class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true # Permite que el comentario se cree sin un usuario
  has_many :reactions, dependent: :destroy

  validates :user_id, presence: true, unless: -> { user_id.nil? }

  validates :content,
  presence: { message: "No puede estar vacío" },
  length: { in: 1..1000, message: "debe tener entre 2 y 1000 caracteres" }
end
