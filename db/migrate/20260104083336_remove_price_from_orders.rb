class RemovePriceFromOrders < ActiveRecord::Migration[7.1]
  def change
    # column_exists? で確認してから削除するように変更
    if column_exists?(:orders, :price)
      remove_column :orders, :price, :integer
    end
  end
end