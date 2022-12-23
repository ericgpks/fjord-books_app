# frozen_string_literal: true

class Follow < ApplicationRecord
  has_many :users
end
