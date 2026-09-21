class CreateUserNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :user_notes do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: false
      t.belongs_to :note, null: false, foreign_key: true, index: false
      t.belongs_to :account, null: false, foreign_key: true

      t.index %i[user_id account_id], name: "idx_user_acc"
      t.index %i[account_id note_id], name: "idx_user_note"

      t.timestamps
    end
  end
end
