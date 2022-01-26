var formData = "";

function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	event.stopPropagation();
	winleft = (window.screen.width/2) - (WinWidth/2);
	wintop = (window.screen.height/2)- (WinHeight/2);
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}


// 목록 검색
function list_go(page,url){
	if(!url) url= window.location.href;
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;

	jobForm.find("[name='page']").val(page);

	if($('select[name="perPageNum"]').val()){
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	}
	
	console.log(jobForm.find("[name='perPageNum']").val());
	
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}
function printData(data,target,templateObject,removeClass){
	var template=Handlebars.compile($(templateObject).html());
	
	var html = template(data);
	$(removeClass).remove();
	$(target).append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);
	
	for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}
	
	pageMaker.pageNum = pageNum;
	pageMaker.prevPageNum = pageMaker.startPage-1;
	pageMaker.nextPageNum = pageMaker.endPage+1;
	
	var template=Handlebars.compile($(templateObject).html());
	
	var html = template(pageMaker);
	$(target + ' '+removeClass).remove();
	$(target).append(html);
	
}
