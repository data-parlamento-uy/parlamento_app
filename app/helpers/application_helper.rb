module ApplicationHelper

  def class_for_menu_link(section, current_section)
    section == current_section ? 'boton margen-derecha active' : 'boton margen-derecha'
  end

  def right_flag_image(political_party)
    case political_party
      when 'partido nacional'      then 'bandera_pn_derecha.svg'
      when 'partido colorado'      then 'bandera_pn_derecha.svg'
      when 'partido independiente' then 'bandera_pi_derecha.svg'
      when 'partido frente amplio' then 'bandera_fa_derecha.svg'
    end
  end
end
