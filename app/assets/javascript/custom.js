function showDiv() {
  var div = document.getElementById("div_hide_click");
  div.style.display = "block";
}

function hideDiv() {
  var div = document.getElementById("div_hide_click");
  div.style.display = "none";
}

function listn5(i) {
  var elements = document.querySelector(".gioi_thieu_n5");
    elements.style.display = "none";
  var elements = document.querySelectorAll(".listn5_content");
  elements.forEach(function(element) {
    element.style.display = "none";
  });
  var div = document.getElementById(i)
  div.style.display = "block";

}


function toggleDiv(item, mui_ten) {
  var div = document.getElementById(item);
  var element = document.querySelector(mui_ten);
  element.classList.toggle("mui_ten_home_90");
    
  if (div.style.display === "block") {
    div.style.display = "none";
  } else {
    div.style.display = "block";
  }
}

function loadContent(bai) {
  // Xóa nội dung placeholder
  document.getElementById('renderedContent').innerHTML = '';
  // Gửi yêu cầu đến server và nhận nội dung được render
  console.log(new Error().stack);
  fetch('/' + bai)
    .then(response => response.text())
    .then(content => {
      document.getElementById('renderedContent').innerHTML = content;
    })
    .catch(error => console.log(error));
}