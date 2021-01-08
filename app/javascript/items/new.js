function calculate() {
  const calculateFee = document.getElementById("add-tax-price")
  const inputPrice = document.getElementById("item-price")
  const calculateProfit = document.getElementById("profit")

  inputPrice.addEventListener('input', function(){
    const inputValue = inputPrice.value
    const fee = Math.floor(inputValue * 0.1)
    const fee_comma = fee.toLocaleString('ja-JP')
    const profit = Math.floor(inputValue - fee)
    const profit_comma = profit.toLocaleString('ja-JP')
    calculateFee.innerHTML = fee_comma
    calculateProfit.innerHTML = profit_comma
  })
}

window.addEventListener('load',calculate)