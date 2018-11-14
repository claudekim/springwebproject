/*
	imgsrc : 이미지파일여부에따라 썸넬 혹은 아이콘
	getLink : 업로드한 파일명
	fileName : 오리지널 파일명
	fullName : uuid+오리지널 파일명
 */

function checkImageType(fileName) {
	var pattern = /jpg|png|gif|jpeg/i;
	return fileName.match(pattern);
}



function getImgFileInfo(fullName) {
	var fileName, imgsrc , getLink;

	if(checkImageType(fullName)){
		fileName = fullName.substring(fullName.lastIndexOf("_")+1); 
		imgsrc = "/displayFile?fileName="+fullName; 
		var prefix = fullName.substring(0,12); 
		var suffix = fullName.substring(14);
		getLink = "/displayFile?fileName="+(prefix+suffix);
	}
	return {fullName : fullName, fileName : fileName , getLink : getLink , imgsrc : imgsrc};
} 


function getFileInfo(fullName) {
	var fileName, imgsrc , getLink;

	fileName = fullName.substring(fullName.lastIndexOf("_")+1); 
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName="+fullName; 
		var prefix = fullName.substring(0,12); 
		var suffix = fullName.substring(14);
		getLink = "/displayFile?fileName="+(prefix+suffix);
	}else{
		imgsrc="/resources/icom.png"; 
		getLink ="/displayFile?fileName="+fullName; 
	}
	return {fullName : fullName, fileName : fileName , getLink : getLink , imgsrc : imgsrc};
}