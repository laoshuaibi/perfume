$(function() {
	showNum();
});

function showNum() {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("tolNum").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("POST", "servlet/CartServlet?action=sum", false);
	xmlhttp.send();
}
function selflog_show(id) {
	toastr.success("添加成功")
	if (document.getElementById("number") != null)
		var num = document.getElementById("number").value;
	else
		num = 1;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("tolNum").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("POST", 'servlet/CartServlet?id=' + id + '&num=' + num
			+ '&action=add', false);
	xmlhttp.send();
}
