# frozen_string_literal: true

class ProposalSection < ApplicationRecord
  include AccountScoped

  belongs_to :proposal
  has_many :proposal_items, dependent: :destroy

  validates :title, presence: true

  def subtotal
    proposal_items.reject(&:optional?).sum(&:total_price)
  end

  def options_total
    proposal_items.select(&:optional?).sum(&:total_price)
  end
end
