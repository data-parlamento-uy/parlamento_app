module ApplicationHelper

  def class_for_menu_link(section, current_section)
    section == current_section ? 'boton margen-derecha active' : 'boton margen-derecha'
  end

  def class_for_submenu_link(section, current_section)
    section == current_section ? 'boton margen-izquierda active' : 'boton margen-izquierda'
  end

  def class_for_filter(filter, current_filter)
    filter == current_filter ? 'label margen-izquierda-mitad active' : 'label margen-izquierda-mitad'
  end

  def right_flag_image(political_party)
    case political_party
      when 'partido nacional'      then 'bandera_pn_derecha.svg'
      when 'partido colorado'      then 'bandera_pc_derecha.svg'
      when 'partido independiente' then 'bandera_pi_derecha.svg'
      when 'partido frente amplio' then 'bandera_fa_derecha.svg'
    end
  end

  def left_flag_image(political_party)
    case political_party.name
      when 'partido nacional'      then 'bandera_pn.svg'
      when 'partido colorado'      then 'bandera_pc.svg'
      when 'partido independiente' then 'bandera_pi.svg'
      when 'partido frente amplio' then 'bandera_fa.svg'
    end
  end

  def pretty_text(text)
    text.capitalize!
    exc = %w(y con el de para del se la sobre a las que)
    text.split(" ").map {|word| exc.include?(word) ? word : word.capitalize }.join(" ")
  end

  def state_abbr(state_name)
    case state_name
      when "cerro largo" then 'crl'
      when "flores" then 'fls'
      when "florida" then "fla"
      when "montevideo" then "mvd"
      when "rio negro" then "rne"
      when "san jose" then "saj"
      when "treinta y tres" then "tyt"
      else state_name[0..2]
    end
  end
end
