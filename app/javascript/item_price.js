function tax() {
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('change', () => {
      const price = itemPrice.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const taxPrice = Math.floor(price / 10);
      const saleProfit = price - taxPrice;

      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit;
  });
}
window.addEventListener("load", tax);
