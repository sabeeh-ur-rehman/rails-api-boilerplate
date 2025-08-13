# frozen_string_literal: true

require 'test_helper'

class ProposalSectionTest < ActiveSupport::TestCase
  test 'calculates section totals' do
    section = create(:proposal_section)
    create(:proposal_item, proposal_section: section, quantity: 1, unit_price: 200)
    create(:proposal_item, proposal_section: section, quantity: 1, unit_price: 50, optional: true)

    assert_equal 200, section.subtotal
    assert_equal 50, section.options_total
  end
end
