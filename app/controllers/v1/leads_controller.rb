# frozen_string_literal: true

module V1
  class LeadsController < ApplicationController
    def index
      render json: Lead.all
    end

    def create
      lead = Lead.new(lead_params)
      if lead.save
        render json: lead, status: :created
      else
        render json: { errors: lead.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def lead_params
      params.require(:lead).permit(:project_name, :job_type, :spa_type, :vanishing_edge,
                                   :rep_id, :client_request_date, :site_address,
                                   :customer_name, :customer_phone, :customer_email, :council)
    end
  end
end
