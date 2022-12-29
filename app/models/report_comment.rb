# frozen_string_literal: true

class ReportComment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :report, dependent: :destroy
end
