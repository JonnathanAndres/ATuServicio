class Provider < ActiveRecord::Base
  has_many :sites, dependent: :delete_all
  has_many :states, through: :sites

  def average(name)
    columns = METADATA[:precios][:averages][name][:columns]
    values = columns.map do |column|
      send(column.to_sym)
    end

    # I cannot average unless I have all the data
    valid_values = values && !values.empty? && !values.include?(nil)
    if valid_values
      (values.reduce(:+).to_f / values.size).round(2)
    else
      nil
    end
  end

  def asse?
    nombre_abreviado.include?('ASSE')
  end

  # What coverage type exists by state
  def coverage_by_state(state, type)
    sites.where(state: state, nivel: type).count
  end

  def sites_by_state(state)
    sites.where(departamento: State.proper_name(state)).order(localidad: :asc)
  end

  def states_names
    state_names = states.uniq.map(&:name).map do |names| # Get state names
      names.split(' ').map do |n| # Separate array to capitalize
        n.capitalize
      end.join(' ') # Join two word States
    end.join(', ') # Comma separate States
  end

  # scope
  # returns the providers list on that state
  def self.by_state
    find(Site.providers_by_state)
  end
end
