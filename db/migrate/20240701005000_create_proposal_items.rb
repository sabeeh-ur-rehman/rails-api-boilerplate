class CreateProposalItems < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_items, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :proposal_section, null: false, foreign_key: true, type: :uuid
      t.string :item_code
      t.text :description, null: false
      t.decimal :quantity, precision: 10, scale: 2, null: false, default: 1
      t.decimal :unit_price, precision: 10, scale: 2, null: false, default: 0
      t.boolean :optional, null: false, default: false

      t.timestamps
    end
  end
end
