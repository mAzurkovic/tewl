class AddPaymentInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payment_url, :string
  end
end
