# frozen_string_literal: true

module Numbers
  class GenerateService < ApplicationService
    option :account

    def next_customer_no
      (account.leads.maximum(:customer_no) || 0) + 1
    end

    def next_job_no
      (account.leads.maximum(:job_no) || 0) + 1
    end
  end
end
