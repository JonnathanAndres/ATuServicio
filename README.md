## Install

Local:

1. Bundle - `bundle`
2. Load database (postgres) `rake db:setup db:import`

## Configuración y CSV's

### /config/metadata.yml
Definición de los metadatos. Mapea archivos CSV a datos. Las llaves son los nombres de los archivos csv's a importar, y ahí se encuentra la estructura a la que vamos a transformar las cosas:

```ruby
2.2.2 :005 > METADATA.keys
 => [:estructura, :metas, :precios, :sedes, :tiempos_espera,
 :satisfaccion_derechos, :rrhh, :solicitud_consultas]
```

Cada elemento tiene 4 grupos:
* `title` - Ejemplo: "Estructura", "Metas Asistenciales"
* `description` - Descripción que mapea a cada columna
* `columns` - Nombre de la columna en el objeto (y la BD)
* `definition` - Los tipos de cada columna (text, boolean, decimal)

Estos datos se cargan en `config/initializers/metadata.rb` en el array `METADATA`.

### estructura.csv
Datos de estructura de los proveedores. Se usa para importar proveedores (ASSE, Española, Casmu, etc.), se mapean al objeto Provider.

### sedes.csv
Datos de sedes (id, dirección, departamento, localildad, nivel, servicios), se mapean al objeto Site.

### metas.csv
Metas asistenciales (porcentaje de afiliados, etc.). Datos que se agregan al objeto Provider.

### precios.csv
Precios de tickets para medicamntos, consultas, demás. Datos que se agregan al objeto Provider.

### tiempos_espera.csv
Tiempos de espera. Datos que se agregan al objeto Provider.

### satisfaccion_derechos.csv
Satisfacción de derechos de usuario (conformidad con disponiblidad, evaluación de tiempos de espera, etc.). Datos que se agregan al objeto Provider.

### rrhh.csv
Recursos Humanos, cargos de médicos generales, de familia, etc. Datos que se agregan al objeto Provider.

### solicitud_consultas.csv
Solicitud de consultas (reserva presencial, telefónica, web). Datos que se agregan al objeto Provider.

## Dependencies

### JavaScript

* **Sticky Table Headers** - [Homepage](http://plugins.jquery.com/StickyTableHeaders/) - [Source code](https://github.com/jmosbech/StickyTableHeaders)
* **Simple Modal jQuery Plugin** - [Homepage](http://simplemodal.com) - [Source code](https://github.com/ericmmartin/simplemodal)
* **Stupid jQuery Table Sort** - [Homepage and source code](https://github.com/joequery/Stupid-Table-Plugin)

### CSS

 * **Bootstrap** - [Homepage](http://getbootstrap.com)
