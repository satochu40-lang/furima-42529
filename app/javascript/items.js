// // ページが読み込まれたとき、またはTurbo (Railsの高速化機能) で画面が遷移した後に実行
// window.addEventListener('turbo:load', function() {
  
//   // 💡 ① 価格入力フィールドの要素を取得 (ID: item-price)
//   const priceInput = document.getElementById("item-price");
  
//   // 価格入力欄が存在しないページ（例：トップページなど）では処理を終了
//   if (!priceInput) { return; }

//   // 💡 ② 入力値が変更されるたびに実行されるイベントリスナーを設定
//   priceInput.addEventListener("input", () => {
    
//     // 💡 ③ 入力値を取得し、整数（数値）に変換
//     const inputValue = priceInput.value;
//     const price = parseInt(inputValue); // 数値以外の入力は NaN になる

//     // 💡 ④ 計算と表示を行う要素を取得
//     const taxPriceElement = document.getElementById("add-tax-price");
//     const profitElement = document.getElementById("profit-price"); // 利益表示欄
    
//     // 入力値が300円以上9,999,999円以下の数値であるかチェック
//     if (price >= 300 && price <= 9999999) {
      
//       // ⑤ 販売手数料 (10%) を計算し、小数点以下を切り捨て
//       const tax = Math.floor(price * 0.1); 
      
//       // ⑥ 利益を計算
//       const profit = price - tax; 
      
//       // ⑦ 結果をHTML要素に反映（toLocaleString() で3桁区切りに整形）
//       if (taxPriceElement) {
//         taxPriceElement.innerHTML = tax.toLocaleString();
//       }
//       if (profitElement) {
//         profitElement.innerHTML = profit.toLocaleString();
//       }
      
//     } else {
//       // 💡 ⑧ 価格が範囲外、または数値ではない場合は表示をリセット
//       if (taxPriceElement) {
//         taxPriceElement.innerHTML = "0";
//       }
//       if (profitElement) {
//         profitElement.innerHTML = "0";
//       }
//     }
//   });
// });