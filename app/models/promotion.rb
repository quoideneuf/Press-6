# frozen_string_literal: true

class Promotion < ApplicationRecord
  has_many :books, dependent: :destroy
  has_rich_text :intro_text
  has_one_attached :pdf, dependent: :destroy
end
