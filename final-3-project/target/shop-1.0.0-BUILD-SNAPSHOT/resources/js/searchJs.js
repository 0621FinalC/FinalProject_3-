
/* 검색 기능 */
$(document).ready(function(){
	
	$("#keyword").keydown(function(e){
		if(e.keyCode == 13) {
			$("#btn_search").click();
			return false;
		} 
	});
	
	$("#btn_search").click(function(){
		/* url 붙여주기 */
		var url = "${search_list }";
		url += "?keyword=" + $('#keyword').val();
		location.href = url;
	});
})
