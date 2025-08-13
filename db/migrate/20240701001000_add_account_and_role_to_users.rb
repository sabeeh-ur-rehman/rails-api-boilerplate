class AddAccountAndRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :account, type: :uuid, null: false, foreign_key: true
    add_column :users, :role, :integer, default: 0, null: false
  end
end
