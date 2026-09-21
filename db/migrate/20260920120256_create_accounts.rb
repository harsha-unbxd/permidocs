class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :image_url, limit: 255
      t.string :short_description, limit: 150
      t.text :description, limit: 500
      t.string :acc_code, limit: 10

      t.timestamps
    end
  end
end
