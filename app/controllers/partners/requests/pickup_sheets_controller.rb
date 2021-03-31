module Partners
  module Requests
    class PickupSheetsController < BaseController

      def show
        @partner_request = current_partner.requests.find(params[:request_id])
        @child_item_requests = @partner_request.child_item_requests
      end
    end
  end
end
