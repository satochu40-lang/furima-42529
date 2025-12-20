class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string     :name,null:false
      t.text       :description
      t.references :user                 
      t.integer    :price  
      t.integer    :category_id   
      t.integer    :sales_status_id 
      t.integer    :shipping_fee_payer_id
      t.integer    :prefecture_id  
      t.integer    :scheduled_delivery_id   
      t.timestamps
    end
   
      change_column_null :items, :name, false
      change_column_null :items, :description, false
      change_column_null :items, :price, false
      change_column_null :items, :category_id, false
      change_column_null :items, :sales_status_id, false
      change_column_null :items, :shipping_fee_payer_id, false
      change_column_null :items, :prefecture_id, false
      change_column_null :items, :scheduled_delivery_id, false
    
      # ⭐️ user_id も追加する場合
      change_column_null :items, :user_id, false
 end
end

