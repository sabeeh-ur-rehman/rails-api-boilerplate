# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should have a valid factory' do
    assert create(:user).persisted?
  end

  context '#indexes' do
    should have_db_index(:email).unique(true)
    should have_db_index(:reset_password_token).unique(true)
  end

  should belong_to(:account)
  should define_enum_for(:role).with_values(%i[admin rep manager])
end
