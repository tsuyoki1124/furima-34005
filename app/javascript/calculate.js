window.addEventListener('load', function(){


  const cal = document.getElementById("item-price");
  cal.addEventListener("keyup", (e)=> {
  const fee = eval(cal.value * 0.1);
  const tax = document.getElementById("add-tax-price").innerHTML = fee;
  const profit = eval(cal.value - fee);
  const pro = document.getElementById("profit").innerHTML = profit;
});
});
