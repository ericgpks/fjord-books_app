# frozen_string_literal: true

class ReportComment < ApplicationRecord
  belongs_to :user
  belongs_to :report
end
