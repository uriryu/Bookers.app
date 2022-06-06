class Book < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :本のタイトル, presence: true
  validates :感想, presence: true
end