require 'json'

task :importar_legisladores => :environment  do
  file = File.read('datos/senadores.json')
  data_hash = JSON.parse(file)

  data_hash['senadores'].each do |senador_data|
    Legislator.create(
      first_name: senador_data['nombre'],
      last_name: senador_data['apellido'],
      chamber: 'S',
      political_party: PoliticalParty.find_by_name(senador_data['partido  '])
    )
  end

  file = File.read('datos/diputados.json')
  data_hash = JSON.parse(file)

  data_hash['diputados'].each do |diputado_data|
    Legislator.create(
        first_name: diputado_data['nombre'],
        last_name: diputado_data['apellido'],
        chamber: 'D',
        political_party: PoliticalParty.find_by_name(diputado_data['partido'])
    )
  end
end

task :importar_comisiones => :environment  do
  file = File.read('datos/comisiones.json')
  data_hash = JSON.parse(file)

  data_hash['comisiones'].each do |comision_data|
    comision = Comission.create({
        name: comision_data['nombre'],
        chamber: comision_data['cuerpo']
    })

    comision_data['integracion']['miembros'].each do |comision_data|
      last_name, first_name = comision_data['text'].downcase.gsub(/\(.*\)/, '').split(', ')
      legislator = Legislator.find_by_first_name_and_last_name(first_name, last_name)
      if legislator
        ComissionParticipant.create({
            legislator: legislator, comission: comision
        })
      end
    end
  end
end