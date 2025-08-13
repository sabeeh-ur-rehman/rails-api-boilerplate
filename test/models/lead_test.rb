# frozen_string_literal: true

require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  test 'should have a valid factory' do
    assert create(:lead).persisted?
  end

  should belong_to(:account)
  should belong_to(:rep)

  should validate_presence_of(:project_name)
  should validate_presence_of(:job_type)
  should validate_presence_of(:spa_type)
  should validate_presence_of(:rep)
  should validate_presence_of(:client_request_date)
  should validate_presence_of(:site_address)
  should validate_presence_of(:customer_name)
  should validate_presence_of(:customer_phone)
  should validate_presence_of(:customer_email)
  should validate_presence_of(:council)

  test 'assigns sequential numbers per account' do
    account = create(:account)
    Current.account = account
    lead1 = create(:lead, account: account)
    lead2 = create(:lead, account: account)
    assert_equal 1, lead1.customer_no
    assert_equal 2, lead2.customer_no
    assert_equal 1, lead1.job_no
    assert_equal 2, lead2.job_no
  end
end
