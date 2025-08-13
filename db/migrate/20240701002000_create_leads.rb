class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.references :account, null: false, foreign_key: true
      t.references :rep, null: false, foreign_key: { to_table: :users }
      t.string :project_name, null: false
      t.string :job_type, null: false
      t.string :spa_type, null: false
      t.boolean :vanishing_edge, default: false, null: false
      t.date :client_request_date, null: false
      t.string :site_address, null: false
      t.string :customer_name, null: false
      t.string :customer_phone, null: false
      t.string :customer_email, null: false
      t.string :council, null: false
      t.integer :customer_no, null: false
      t.integer :job_no, null: false
      t.timestamps
    end

    add_index :leads, [:account_id, :customer_no], unique: true
    add_index :leads, [:account_id, :job_no], unique: true
  end
end
