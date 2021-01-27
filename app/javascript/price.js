function price() {
  const textBox = document.getElementById("item-price");
  textBox.addEventListener('input', () => {
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    tax.innerText = (textBox.value) * 0.1;
    profit.innerText = (textBox.value) - (tax.innerText);
  });
};
window.addEventListener('load', price)