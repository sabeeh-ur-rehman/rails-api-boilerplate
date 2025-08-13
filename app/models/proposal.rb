# frozen_string_literal: true

class Proposal < ApplicationRecord
  include AccountScoped

  belongs_to :lead
  has_many :proposal_sections, dependent: :destroy
  has_many :proposal_items, through: :proposal_sections

  validates :issue_number, presence: true
  validates :status, presence: true
  validates :adjustment_type, presence: true
  validates :adjustment_percentage, presence: true

  enum status: {
    draft: 'draft',
    sent: 'sent',
    approved: 'approved',
    rejected: 'rejected'
  }, _suffix: true

  enum adjustment_type: {
    none: 'none',
    under: 'under',
    over: 'over'
  }, _suffix: true

  def total
    proposal_sections.sum(&:subtotal)
  end

  def options_total
    proposal_sections.sum(&:options_total)
  end

  def adjusted_total
    case adjustment_type
    when 'under'
      total - (total * adjustment_percentage / 100)
    when 'over'
      total + (total * adjustment_percentage / 100)
    else
      total
    end
  end

  def grand_total
    adjusted_total + options_total
  end
end
