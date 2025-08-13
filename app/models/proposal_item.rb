# frozen_string_literal: true

class ProposalItem < ApplicationRecord
  include AccountScoped

  belongs_to :proposal_section

  validates :description, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true

  def total_price
    quantity * unit_price
  end
end
