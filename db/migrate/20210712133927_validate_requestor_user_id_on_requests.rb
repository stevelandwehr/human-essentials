class ValidateRequestorUserIdOnRequests < ActiveRecord::Migration[6.1]
  def change
    validate_foreign_key :partner_requests, :users, column: :requestor_user_id
  end
end
