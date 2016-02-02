# coding: utf-8
module ApplicationHelper
  def columns_name_description(group)
    group_names = METADATA[group][:description]
    group_descriptions = METADATA[group][:columns]

    groups = group_names.zip(group_descriptions)
    # Remove web since we show it elsewhere:
    groups.delete(['Web', 'web'])
    groups
  end

  def state_options(states)
    (['Filtar por departamento'] + states).zip(
      ['todos'] + states.map(&:name)
    )
  end

  def provider_options
    @providers.order(:nombre_abreviado).map do |p|
      [
        p.nombre_abreviado,
        p.id
      ]
    end
  end

  def show_if_valid(provider, field)
    enough_data_field = "datos_suficientes_#{field}"
    if provider.send(enough_data_field)
      provider.send(field)
    else
      nil
    end
  end

  def snis_percentage(affiliates)
    affiliates * 100 / @provider_maximums.affiliates
  end

  # Size for the person icon in the home page. I use '100_000' as the
  # maximum for reference, since the difference is way too big between
  # providers.
  def affiliate_person_size(affiliates)
    max_size = 160
    min_size = 40
    pixels = affiliates * max_size / 100_000
    pixels = min_size if pixels < min_size
    pixels = max_size if pixels > max_size
    pixels
  end

  # Returns true, false, or question mark if value not present
  def boolean_icons(value)
    return"<i class=\"demo-icon icon-ok\"></i>".html_safe if value.is_a?(TrueClass)
    return "<i class=\"demo-icon icon-no\"></i>".html_safe if value.is_a?(FalseClass)
    return ApplicationHelper.no_hay_datos unless value
    value
  end

  def self.no_hay_datos(td = true)
    value = "<p>NO HAY DATOS</p><i class=\"demo-icon icon-sad\"></i>"
    return "<td class=\"nodata\">#{value}</td>" if td
    value
  end
end
