/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(e){e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.filebrowserParams=function(){var e=jQuery("meta[name=csrf-token]").attr("content"),t=jQuery("meta[name=csrf-param]").attr("content"),n=new Object;return t!==undefined&&e!==undefined&&(n[t]=e),n},e.addQueryString=function(e,t){var n=[];if(!t)return e;for(var r in t)n.push(r+"="+encodeURIComponent(t[r]));return e+(e.indexOf("?")!=-1?"&":"?")+n.join("&")},CKEDITOR.on("dialogDefinition",function(t){var n=t.data.name,r=t.data.definition,i,s;$.inArray(n,["link","image","attachment","flash"])>-1&&(i=r.getContents("Upload")||r.getContents("upload"),s=i==null?null:i.get("upload"),s&&s.filebrowser["params"]==null&&(s.filebrowser.params=e.filebrowserParams(),s.action=e.addQueryString(s.action,s.filebrowser.params)))}),e.extraPlugins="embed,attachment",e.toolbar="Easy",e.toolbar_Easy=[["Source","-","Preview"],["Cut","Copy","Paste","PasteText","PasteFromWord"],["Undo","Redo","-","SelectAll","RemoveFormat"],["Styles","Format"],["Subscript","Superscript","TextColor"],["Maximize","-","About"],"/",["Bold","Italic","Underline","Strike"],["NumberedList","BulletedList","-","Outdent","Indent","Blockquote"],["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],["Link","Unlink","Anchor"],["Image","Attachment","Flash","Embed"],["Table","HorizontalRule","Smiley","SpecialChar","PageBreak"]]};