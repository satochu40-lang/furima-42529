// app/javascript/card.js

const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(gon.public_key);
  const elements = payjp.elements();
  
  // 1. 【表示の命令】入力欄の部品を作る
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // 2. 【表示の命令】HTMLの枠(id="number-form")に中身を埋め込む
  // これを書かないと、画面は真っ白なままになります！
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form'); // ← ここに書きます！
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
  
    e.preventDefault();

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラー時の処理（必要に応じて記述）
      } else {
       const token = response.id; // これが tok_07d6a4cf248cbf1eb71641e2a79e
       const renderDom = document.getElementById("charge-form");
       // name='token' という名前で、トークンを隠し入れる
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // 3. 【後片付けの命令】入力された情報をフォームから消す
      // ここに .clear() を残しておきます。上書きしません。
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      // 4. Railsへ送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);