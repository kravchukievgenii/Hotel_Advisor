module ApplicationHelper
  def menu_item(name, url)
    if @active_menu_item == name.downcase.to_sym || current_page?(url)
      opt = { class: 'active' }
    end
    content_tag :li, opt do
      link_to name, url
    end
  end
end