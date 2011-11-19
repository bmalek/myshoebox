module ReceiptsHelper
  
  def view_style_selector
    if @view_format=='calendar' 
      @list_style_display = 'display: none'
      @calendar_style_display = 'display: block'
      true
    else
      @calendar_style_display = 'display: none'
      @list_style_display = 'display: block'
      false
    end           
    
  end
    
  
end
