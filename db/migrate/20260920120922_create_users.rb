class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, limit: 100
      t.integer :age
      t.belongs_to :account, null: false, foreign_key: true
      t.string :avatarurl
      t.string :mobile
      t.string :tagline

      t.index %i[email account_id], name: "idx_email_account"

      t.timestamps
    end
  end
end
