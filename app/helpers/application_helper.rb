module ApplicationHelper

  def class_for_menu_link(section, current_section)
    section == current_section ? 'boton margen-derecha active' : 'boton margen-derecha'
  end
end
