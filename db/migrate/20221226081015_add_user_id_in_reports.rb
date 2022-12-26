class AddUserIdInReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :user, index: false, foreign_key: true
  end
end
