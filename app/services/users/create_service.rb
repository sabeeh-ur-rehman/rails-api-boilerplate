# frozen_string_literal: true

module Users
  class CreateService < ApplicationService
    option :params, type: Types::Hash

    def call
      user = yield create_resource(User)

      Success(user)
    end

    private

    def params
      account = Current.account || Account.first || Account.create!(name: 'Default', subdomain: 'default')
      super.merge(account:, role: :rep)
    end
  end
end
