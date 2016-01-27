# coding: utf-8
module IconsHelper
  def self.render_icons(provider, value, max, icon)
    display = ''
    # Get the actual value for this column:
    clocks = calculate_value(provider.send(value[0]), max)
    clocks.times do
      display += "<i class=\"icon-#{icon}\"></i> "
    end
    if clocks < 5
      (5 - clocks).times do
        display += "<i class=\"icon-#{icon} disable\"></i> "
      end
    end
    display.html_safe
  end

  def ordered_tickets(provider)
    structure = []
    tickets_show.each do |ticket|
      structure << {
        average: provider.average(ticket[0]),
        label: ticket[1]
      }
    end
    structure.sort! { |x, y| y[:average] <=> x[:average] }
  end

  private

  def percentages_value(provider, value)
    html = ''
    begin
      percentage = provider.send(value[0])
      if percentage == nil
        html += IconsHelper.no_data
      else
        if value[0] == :satisfaccion_primer_nivel_atencion_2014
          html += "<h4>#{number_with_delimiter(provider.send(value[0]), separator: ',')}</h4>"
        else
          html += progress_bar(percentage)
        end
      end
    rescue
      html += IconsHelper.no_data
    end
    html
  end

  def self.no_data
    html = <<-eos
    <div class="nodata">
      <p>NO HAY DATOS</p>
      <i class="demo-icon icon-sad"></i>
    </div>
    eos
    html
  end

  def self.calculate_value(value, max)
    (value.to_f * 5 / max).round
  end
end
