class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string     :name,                    null:false
      t.text       :description,             null:false
      t.references :user,                    null:false, foreign_key: true             
      t.integer    :price,                   null:false
      t.integer    :category_id,             null:false  
      t.integer    :sales_status_id,         null:false 
      t.integer    :shipping_fee_payer_id,   null:false
      t.integer    :prefecture_id,           null:false  
      t.integer    :scheduled_delivery_id,   null:false   
      t.timestamps
    end     
 end
end

