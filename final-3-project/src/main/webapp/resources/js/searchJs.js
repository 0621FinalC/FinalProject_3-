
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
		var searchKeyword = $('#keyword').val();
		url += "?keyword=" + encodeURIComponent(searchKeyword);
		location.href = url;
	});
})
