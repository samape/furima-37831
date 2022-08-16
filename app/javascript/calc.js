function calc (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    const taxAmount = Math.floor(inputValue * 0.1);
    
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${taxAmount}`;

    const profitAmount = Math.floor(inputValue - taxAmount);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${profitAmount}`;
  });
};

window.addEventListener('load', calc);