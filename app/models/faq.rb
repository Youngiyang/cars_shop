class Faq < ApplicationRecord
  validates :question, presence: true, length: 2..500
  validates :answer, presence: true, length: 2..500
end
