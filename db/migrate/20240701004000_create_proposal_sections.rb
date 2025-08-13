class CreateProposalSections < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_sections, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :proposal, null: false, foreign_key: true, type: :uuid
      t.string :title, null: false
      t.integer :position
      t.datetime :completed_at

      t.timestamps
    end
  end
end
