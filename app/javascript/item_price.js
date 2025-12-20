// 1. まず、計算から表示までの「一連の仕事」を定数 price に代入します
const price = () => {
  const priceInput = document.getElementById("item-price");
  const taxPriceElement = document.getElementById("add-tax-price");
  const profitElement = document.getElementById("profit");

  // 要素が存在しない場合は、エラーにならないようにここで処理を終了します
  if (!priceInput || !taxPriceElement || !profitElement) return;

  // 2. 入力欄に数字が打ち込まれた時の動きを定義します
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 入力値が空の場合は、表示を 0 にして計算をスキップします
    if (inputValue === "") {
      taxPriceElement.innerHTML = "0";
      profitElement.innerHTML = "0";
      return;
    }

    const priceValue = Number(inputValue);

    // 3. 数値チェック：300円〜9,999,999円の間かどうか
    if (priceValue >= 300 && priceValue <= 9999999) {
      // 販売手数料 (10%) を計算し、小数点を切り捨て
      const tax = Math.floor(priceValue * 0.1);
      // 販売利益を計算
      const profit = priceValue - tax;

      // 4. ブラウザ上に描画（カンマ区切りにする）
      taxPriceElement.innerHTML = tax.toLocaleString();
      profitElement.innerHTML = profit.toLocaleString();
    } else {
      // 範囲外の場合は 0 またはハイフンなどを表示
      taxPriceElement.innerHTML = "0";
      profitElement.innerHTML = "0";
    }
  });
};

// 5. ページが読み込まれた時、または遷移した時に実行
window.addEventListener('turbo:load', price);
// 6. バリデーションエラーなどでページが再描画（render）された時にも実行
window.addEventListener('turbo:render', price);