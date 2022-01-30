class AddColumnToWallet < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :current_balance, :float
  end
end
