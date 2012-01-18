# -*- encoding : utf-8 -*-
module ApplicationHelper
    def redactor(element) 
      content_tag(:script, "$(document).ready(
        function()
        {
          $('#{element}').editor(redactor); 
        }
        );",:type => "text/javascript")
    end
end
