# frozen_string_literal: true

module AccountScoped
  extend ActiveSupport::Concern

  included do
    belongs_to :account
    default_scope { where(account_id: Current.account.id) if Current.account }
  end
end
