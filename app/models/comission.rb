class Comission < ActiveRecord::Base
  has_many :comission_participants
  has_many :legislators, through: :comission_participants

  CHAMBERS = { diputados: 'D', senadores: 'S', asamblea_general: 'A' }

  scope :of_diputados, -> { where(chamber: CHAMBERS[:diputados]) }
  scope :of_senadores, -> { where(chamber: CHAMBERS[:senadores]) }
  scope :of_asamblea_general, -> { where(chamber: CHAMBERS[:asamblea_general]) }
  scope :by_name, -> { order('name ASC') }

  def categories
    case name.downcase
      when 'educacion y cultura', 'educación y cultura' then ['cultura', 'educacion']
      when 'asuntos laborales y seguridad social' then ['trabajo', 'sociales']
      when 'medio ambiente' then ['medio_ambiente']
      when 'industria' then ['industria']
      when 'salud pública' then ['salud']
      when 'salud publica y asistencia social' then ['salud', 'sociales']
      when 'vivienda y ordenamiento territorial', 'vivienda' then ['vivienda']
      when 'asuntos internacionales' then ['internacional']
      when 'defensa nacional' then ['defensa']
      when 'transporte y obras públicas' then ['transporte']
      when 'presupuesto', 'presupuestos', 'hacienda', 'hacienda y presupuesto' then ['economia']
      when 'derechos humanos', /poblaci.n/, 'derechos humanos y peticiones', 'seguridad social' then ['sociales']
      when 'transporte' then ['tranporte']
      when 'turismo' then ['turismo']
      when 'legislacion del trabajo' then ['trabajo']
      when /deporte/ then ['deporte']
      when /genero y equidad/ then ['sociales']
      else ['otros']
    end
  end

end