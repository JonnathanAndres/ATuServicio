# coding: utf-8
class HomeController < ApplicationController
  layout 'atuservicio'

  def index
    # Get the ProviderMaximum object which contains all the maximum
    # values to compare in the graphs in the home view.
    @provider_maximums = Rails.cache.fetch('provider_maximums', expires_in: 120.hours) do
      ProviderMaximum.first
    end

    @title = 'Inicio'
    @description = 'Toda la información e indicadores de todos los prestadores de Salud de Uruguay para elegir informado o conocer a fondo los indicadores de tu servicio de salud.'

    # Get the selected state if we want to have the providers for a
    # given state
    @selected_state = params['departamento']

    @sel_providers = if @selected_state && @selected_state != 'todos'
                       state = State.find_by_name(@selected_state)
                       state.providers.order(:private_insurance).order(:nombre_abreviado).uniq
                     else
                       @providers.order(:private_insurance).order(:nombre_abreviado)
                     end
  end
end
