//= require jquery-ui-timepicker-addon
//= require jquery-fileupload/jquery.iframe-transport
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require image_upload

function commaJoin(element, string)
{
	if (element.val().length == 0)
  {
    newString = string;
  }
  else
  {
    newString = element.val();
    newString = newString.replace((", " + string), "");
    newString = newString.replace((string + ", "), "");
    newString = newString + ", " + string;
    //Effect.Highlight(element);
  }
  element.val(newString);
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
	return false;
}
