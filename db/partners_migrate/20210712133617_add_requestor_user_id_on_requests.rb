class AddRequestorUserIdOnRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :partner_requests, :requestor_user_id, :integer
    add_foreign_key :partner_requests, :users, column: :requestor_user_id, validate: false
  end
end
