module FormHelper
  
  def self.included(base)
    ActionView::Helpers::FormBuilder.instance_eval do 
      include FormBuilderMethods
    end
  end
  
  module FormBuilderMethods
		
		def tag_field(attribute, default_tags=[])
  	  tag_list_name = attribute.to_s.singularize + "_list"
  	  ret = @template.text_area(@object_name, tag_list_name, :rows => 2).to_s
  	  ret2 = "<div class='tag_zone'>"
  	  for tag in default_tags
  	  	ret2 += "<span class='tag' onClick='commaJoin($(\"##{@object_name}_#{tag_list_name}\"), \"#{tag}\");'>"
  	    ret2 += tag
  	    ret2 += "</span> "
  	  end
  	  for tag in object.class.tag_counts_on(attribute)
  	  	unless default_tags.include?(tag.name)
	  	    ret2 += "<span class='tag' onClick='commaJoin($(\"##{@object_name}_#{tag_list_name}\"), \"#{tag.name}\");'>"
	  	    ret2 += tag.name
	  	    ret2 += "</span> "
	    	end
  	  end
  	  ret2 += "</div>"
      ret + ret2.html_safe
  	end
		
	end
	
	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
	end
  
	def link_to_add_fields(name, f, association)
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
			render(association.to_s.singularize + "_fields", :f => builder)
		end
		link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	end
	
  def field_set_tag_toggle(div, legend=nil, &block)
    legend  = div.titleize if !legend
    content = capture(&block)
    output  = tag(:fieldset)
    output.safe_concat(
      content_tag(:legend, legend,
                  :class   => "clickable",
                  :onclick => "this.text = $('##{div}').is(':visible') ? 'show' : 'hide'; $('##{div}').slideToggle()"
      )
    )
    output.safe_concat("<div id=\"#{div}\" style=\"display:none;\">")
      output.concat(content)
    output.safe_concat("</div>")
    output.safe_concat("</fieldset>")
  end
  
end