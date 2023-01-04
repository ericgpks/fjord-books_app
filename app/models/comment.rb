# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :comment_record, polymorphic: true
end
