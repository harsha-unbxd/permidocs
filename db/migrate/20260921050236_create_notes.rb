class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.string :title, limit: 150
      t.text :body, limit: 2000
      t.text :footer, limit: 500
      t.integer :nstatus, default: 0, null: false
      t.timestamp :published_at
      t.belongs_to :account, null: false, foreign_key: true

      t.index %i[account_id nstatus], name: "idx_acc_status"
      t.index %i[account_id published_at], name: "idx_acc_publshedat"

      t.timestamps
    end
  end
end
