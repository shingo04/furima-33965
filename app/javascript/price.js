function price() {
  const textBox = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  tax.innerText = (textBox.value) * 0.1;
  profit.innerText = (textBox.value) - (tax.innerText);
};
window.setInterval(price, 500)