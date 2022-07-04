
restList = {}

//////////////////////////////////////////////////////////////////////////
///////////////////////    게시판 리스트     ////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

restList.getList = function(){
	
	var url = "http://localhost/restboard/list"
	
	$.ajax ({
		
		url			:	url
		,type		:	'GET'
		,dataType	:	'JSON'
		,headers	: {
			
			'Content-Type'	:	'application/json;charset=UTF-8'
		}
		,succes		:	function(result){
			
			alert('성공!!!!');
			
		}	
		,error		:	function(x, o, e){
		
			alert('실패!!!!');
		}
	
	});
	
}