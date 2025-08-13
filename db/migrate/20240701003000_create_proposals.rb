class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :lead, null: false, foreign_key: true, type: :uuid
      t.integer :issue_number, null: false, default: 1
      t.string :status, null: false, default: 'draft'
      t.string :adjustment_type, null: false, default: 'none'
      t.decimal :adjustment_percentage, precision: 5, scale: 2, null: false, default: 0

      t.timestamps
    end

    add_index :proposals, [:lead_id, :issue_number], unique: true
  end
end
