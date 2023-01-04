class DropReportComment < ActiveRecord::Migration[6.1]
  def change
    drop_table :report_comments do |t|
      t.references :report, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
