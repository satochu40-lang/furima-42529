class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string     :name
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
  end
end
