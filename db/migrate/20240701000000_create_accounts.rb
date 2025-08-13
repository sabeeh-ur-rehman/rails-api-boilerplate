class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.timestamps
    end
    add_index :accounts, :subdomain, unique: true
  end
end
