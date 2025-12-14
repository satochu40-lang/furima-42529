require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)

  end


  describe '商品出品' do
    context '出品できるとき（正常系）' do
      it '必須項目とActive HashのID、価格が全て適切な値で存在すれば登録できる' do
        # FactoryBotで作成した@itemが、全てのバリデーションを通過することを確認
        expect(@item).to be_valid
      end
    end

    context '出品できないとき（異常系）' do
      
      # --- 1. 必須項目（presence）のテスト ---

      it '商品画像がない場合は登録できない' do
        # 💡 画像が必須の場合 (ActiveStorage)
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it '商品名がない場合は登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品説明がない場合は登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      
      it '価格がない場合は登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      # --- 2. Active Hash IDのテスト (IDが1では登録できない) ---
      
      it 'カテゴリーIDが1（---）では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '商品の状態IDが1（---）では登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '配送料の負担IDが1（---）では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      
      it '発送元の地域IDが1（---）では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送までの日数IDが1（---）では登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      # --- 3. 価格のテスト ---
      
      it '価格が300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      
      it '価格が10,000,000円以上では登録できない' do
        @item.price = 10_000_000 # 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end

      it '価格が半角数字以外では登録できない' do
        @item.price = "３０００" # 全角数字
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で入力してください")
      end
      
      # --- 4. 関連付けのテスト ---
      
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

    end
  end
end


  




