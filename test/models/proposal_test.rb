# frozen_string_literal: true

require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  test 'should have a valid factory' do
    assert create(:proposal).persisted?
  end

  should belong_to(:lead)
  should have_many(:proposal_sections)
  should have_many(:proposal_items)

  test 'calculates totals correctly' do
    proposal = create(:proposal)
    section = create(:proposal_section, proposal: proposal)
    create(:proposal_item, proposal_section: section, quantity: 2, unit_price: 100)
    create(:proposal_item, proposal_section: section, quantity: 1, unit_price: 50, optional: true)
    section2 = create(:proposal_section, proposal: proposal)
    create(:proposal_item, proposal_section: section2, quantity: 1, unit_price: 100)

    assert_equal 300, proposal.total
    assert_equal 50, proposal.options_total
    assert_equal 350, proposal.grand_total
  end
end
