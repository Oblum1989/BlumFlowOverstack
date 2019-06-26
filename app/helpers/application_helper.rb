module ApplicationHelper
    def markdown(text)
      options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
      }
  
      extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
      }
  
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
  
      markdown.render(text).html_safe
    end
  
    def flash_msg(key)
      case key
        when 'notice' then 'alert alert-dismissible alert-info'
        when 'success' then 'alert alert-dismissible alert-success'
        when 'error' then 'alert alert-dismissible alert-danger'
        when 'alert' then 'alert alert-dismissible alert-warning'
      end
    end
end
