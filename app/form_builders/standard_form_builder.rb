class StandardFormBuilder < ActionView::Helpers::FormBuilder
  def field_type(options = {})
  	
	case options[:type]
  	when "text"
  	  text_field(options[:label])
  	when "text_area"
  	  text_area(options[:label])
  	when "hidden"
  	  hidden_field(options[:label])
  	when "check_box"
  	  checkbox = options[:values]
  	  checkbox.map {|value| value << " " << check_box(value, {}, true, false)}.join.html_safe
  	when "select"
  	  select("post", options[:values])
  	else
  	end
  end

  def text_field(method, *args)
    options = args.extract_options!
    new_class = options[:class] || "textbox"
    super(method, *(args << options.merge(:class => new_class)))
  end

  def text_area(method, *args)
    @template.content_tag :div, class: "field" do
    	@template.tag(:br) + super
    end
  end  

  def hidden_field(method, options = {})
    @emitted_hidden_id = true if method == :id
    @template.hidden_field(@object_name, method, objectify_options(options))
  end
 
  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    @template.check_box(@object_name, method, objectify_options(options), checked_value, unchecked_value)
  end
  
  def select(method, choices = nil, options = {}, html_options = {}, &block)
    @template.select(@object_name, method, choices, objectify_options(options), @default_options.merge(html_options), &block)
  end 
end