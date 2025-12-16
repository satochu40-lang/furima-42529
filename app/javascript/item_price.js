// app/javascript/item_price.js

window.addEventListener('turbo:load', () => {
    console.log("ok")
  // 1. 必要な要素を取得する
  // ⭐️ 修正点: IDを HTMLに合わせた "item-price" に変更しました ⭐️
  const priceInput = document.getElementById("item-price"); 
  
  // 手数料表示欄を取得
  const taxPriceElement = document.getElementById("add-tax-price"); 
  
  // 利益表示欄を取得
  const profitElement = document.getElementById("profit"); 

  // 要素が取得できない場合は処理を終了 (Consoleにエラーが出なくなります)
  if (!priceInput || !taxPriceElement || !profitElement) return;

  // 2. 入力するたびにイベントを発火
  priceInput.addEventListener("input", () => {
    
    // 3. 入力された値を取得し、数値に変換
    const inputValue = Number(priceInput.value); 

    // 4. 計算前のチェック: 値が無効な場合、または範囲外の場合の処理
    if (isNaN(inputValue) || inputValue < 300 || inputValue > 9999999) {
      taxPriceElement.innerHTML = 0;
      profitElement.innerHTML = 0;
      return; 
    }

    // 5. 販売手数料 (10%) の計算 (小数点以下は切り捨て)
    const tax = Math.floor(inputValue * 0.1); 
    
    // 6. 販売利益の計算
    const profit = inputValue - tax;

    // 7. ブラウザ上に描画
    // カンマ区切りで見やすくするために toLocaleString() を使用
    
    // 手数料表示欄に出力
    taxPriceElement.innerHTML = tax.toLocaleString(); 
    
    // 利益表示欄に出力
    profitElement.innerHTML = profit.toLocaleString();
  });
});