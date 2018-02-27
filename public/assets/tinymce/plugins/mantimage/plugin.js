/**
 * plugin.js
 *
 * Copyright, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://www.tinymce.com/license
 * Contributing: http://www.tinymce.com/contributing
 */
tinymce.PluginManager.add("mantimage",function(t){function e(t,e){function i(t,i){n.parentNode.removeChild(n),e({width:t,height:i})}var n=new Image;n.onload=function(){i(n.clientWidth,n.clientHeight)},n.onerror=function(){i()},n.src=t;var a=n.style;a.visibility="hidden",a.position="fixed",a.bottom=a.left=0,a.width=a.height="auto",document.body.appendChild(n)}function i(e){return function(){var i=t.settings.image_list;"string"==typeof i?tinymce.util.XHR.send({url:i,success:function(t){e(tinymce.util.JSON.parse(t))}}):e(i)}}function n(i){function n(){var t=[{text:"None",value:""}];return tinymce.each(i,function(e){t.push({text:e.text||e.title,value:e.value||e.url,menu:e.menu})}),t}function a(t){var e,i,n,a;e=s.find("#width")[0],i=s.find("#height")[0],n=e.value(),a=i.value(),s.find("#constrain")[0].checked()&&u&&g&&n&&a&&(t.control==e?(a=Math.round(n/u*a),i.value(a)):(n=Math.round(a/g*n),e.value(n))),u=n,g=a}function l(){function e(e){function n(){e.onload=e.onerror=null,t.selection.select(e),t.nodeChanged()}e.onload=function(){i.width||i.height||m.setAttribs(e,{width:e.clientWidth,height:e.clientHeight}),n()},e.onerror=n}var i=s.toJSON();""===i.width&&(i.width=null),""===i.height&&(i.height=null),""===i.style&&(i.style=null),i={src:i.src,alt:i.alt,width:i.width,height:i.height,style:i.style},p?m.setAttribs(p,i):(i.id="__mcenew",t.insertContent(m.createHTML("img",i)),p=m.get("__mcenew"),m.setAttrib(p,"id",null)),e(p)}function o(t){return t&&(t=t.replace(/px$/,"")),t}function r(){e(this.value(),function(t){t.width&&t.height&&(u=t.width,g=t.height,s.find("#width").value(u),s.find("#height").value(g))})}function c(){function t(t){return t.length>0&&/^[0-9]+$/.test(t)&&(t+="px"),t}var e=s.toJSON(),i=m.parseStyle(e.style);delete i.margin,i["margin-top"]=i["margin-bottom"]=t(e.vspace),i["margin-left"]=i["margin-right"]=t(e.hspace),i["border-width"]=t(e.border),s.find("#style").value(m.serializeStyle(m.parseStyle(m.serializeStyle(i))))}var s,d,u,g,h,m=t.dom,p=t.selection.getNode();u=m.getAttrib(p,"width"),g=m.getAttrib(p,"height"),"IMG"!=p.nodeName||p.getAttribute("data-mce-object")?p=null:d={src:m.getAttrib(p,"src"),alt:m.getAttrib(p,"alt"),width:u,height:g},i&&(h={name:"target",type:"listbox",label:"Image list",values:n(),onselect:function(t){var e=s.find("#alt");(!e.value()||t.lastControl&&e.value()==t.lastControl.text())&&e.value(t.control.text()),s.find("#src").value(t.control.value())}});var y=[{name:"src",type:"filepicker",filetype:"image",label:"Source",autofocus:!0,classes:"image-url-input",onchange:r},{name:"alt",type:"textbox",label:"Image description",classes:"image-alt-input"},{type:"container",label:"Dimensions",layout:"flex",direction:"row",align:"center",spacing:5,items:[{name:"width",type:"textbox",maxLength:3,size:3,onchange:a},{type:"label",text:"x"},{name:"height",type:"textbox",maxLength:3,size:3,onchange:a},{name:"constrain",type:"checkbox",checked:!0,text:"Constrain proportions"}]},h,{name:"upload",type:"button",size:40,text:"Upload New File",onclick:function(){t.windowManager.open({title:"Upload New File",url:"/admin/images/new_inline",width:505,height:153})}}];t.settings.image_advtab?(p&&(d.hspace=o(p.style.marginLeft||p.style.marginRight),d.vspace=o(p.style.marginTop||p.style.marginBottom),d.border=o(p.style.borderWidth),d.style=t.dom.serializeStyle(t.dom.parseStyle(t.dom.getAttrib(p,"style")))),s=t.windowManager.open({title:"Insert/edit image",data:d,bodyType:"tabpanel",body:[{title:"General",type:"form",items:y},{title:"Advanced",type:"form",pack:"start",items:[{label:"Style",name:"style",type:"textbox"},{type:"form",layout:"grid",packV:"start",columns:2,padding:0,alignH:["left","right"],defaults:{type:"textbox",maxWidth:50,onchange:c},items:[{label:"Vertical space",name:"vspace"},{label:"Horizontal space",name:"hspace"},{label:"Border",name:"border"}]}]}],onSubmit:l})):s=t.windowManager.open({title:"Edit image",data:d,body:y,onSubmit:l})}t.addButton("image",{icon:"image",tooltip:"Insert/edit image",onclick:i(n),stateSelector:"img:not([data-mce-object])"}),t.addMenuItem("image",{icon:"image",text:"Insert image",onclick:i(n),context:"insert",prependToContext:!0})});