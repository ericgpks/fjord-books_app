# frozen_string_literal: true

class BookComment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :book, dependent: :destroy
end
