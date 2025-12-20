# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
category_names = [
  "レディース",
  "メンズ",
  "ベビー・キッズ",
  "家電・スマホ・カメラ",
  "おもちゃ・ホビー・グッズ",
  "コスメ・香水・美容",
  "自動車・オートバイ",
  "その他"
]

# 定義したカテゴリー名を一つずつデータベースに登録します
category_names.each do |name|
  # find_or_create_by! を使うことで、同じ名前のカテゴリーが既に存在する場合は作成せず、
  # 存在しない場合のみ新しく作成します（これが冪等性を保つ方法です）
  Category.find_or_create_by!(name: name)
end

# 実行結果を確認するためのメッセージ（必須ではありませんが、動作確認に役立ちます）
puts "カテゴリーデータを #{Category.count} 件登録しました。"
