# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150129121208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "providers", force: :cascade do |t|
    t.string  "nombre_abreviado"
    t.string  "nombre_completo"
    t.string  "web"
    t.integer "afiliados"
    t.decimal "meta_medico_referencia"
    t.decimal "meta_ninos_controlados"
    t.decimal "meta_embarazadas"
    t.boolean "espacio_adolescente"
    t.text    "comunicacion"
    t.decimal "ticket_de_medicamentos_general_fonasa"
    t.decimal "ticket_de_medicamentos_general_no_fonasa"
    t.decimal "ticket_de_medicamentos_topeados_fonasa"
    t.decimal "ticket_de_medicamentos_topeados_no_fonasa"
    t.decimal "consulta_medicina_general_fonasa"
    t.decimal "consulta_medicina_general_no_fonasa"
    t.decimal "consulta_pediatria_fonasa"
    t.decimal "consulta_pediatria_no_fonasa"
    t.decimal "consulta_control_de_embarazo_fonasa"
    t.decimal "consulta_control_de_embarazo_no_fonasa"
    t.decimal "consulta_ginecologia_fonasa"
    t.decimal "consulta_ginecologia_no_fonasa"
    t.decimal "consulta_otras_especialidades_fonasa"
    t.decimal "consulta_otras_especialidades_no_fonasa"
    t.decimal "consulta_urgencia_centralizada_fonasa"
    t.decimal "consulta_urgencia_centralizada_no_fonasa"
    t.decimal "consulta_no_urgencia_domicilio_fonasa"
    t.decimal "consulta_no_urgencia_domicilio_no_fonasa"
    t.decimal "consulta_urgencia_domicilio_fonasa"
    t.decimal "consulta_urgencia_domicilio_no_fonasa"
    t.decimal "consulta_odontologica_fonasa"
    t.decimal "consulta_odontologica_no_fonasa"
    t.decimal "consulta_medico_de_referencia_fonasa"
    t.decimal "consulta_medico_de_referencia_no_fonasa"
    t.decimal "endoscopia_digestiva_endoscopia_fonasa"
    t.decimal "endoscopia_digestiva_endoscopia_no_fonasa"
    t.decimal "ecografia_simple_fonasa"
    t.decimal "ecografia_simple_no_fonasa"
    t.decimal "ecodoppler_fonasa"
    t.decimal "ecodoppler_no_fonasa"
    t.decimal "rx_simple_fonasa"
    t.decimal "rx_simple_no_fonasa"
    t.decimal "rx_torax_fonasa"
    t.decimal "rx_torax_no_fonasa"
    t.decimal "rx_colorectal_fonasa"
    t.decimal "rx_colorectal_no_fonasa"
    t.decimal "resonancia_fonasa"
    t.decimal "resonancia_no_fonasa"
    t.decimal "tomografia_fonasa"
    t.decimal "tomografia_no_fonasa"
    t.decimal "laboratorio_rutina_basica_fonasa"
    t.decimal "laboratorio_rutina_basica_no_fonasa"
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "provider_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "direccion"
    t.string   "departamento"
    t.string   "localidad"
    t.string   "nivel"
    t.boolean  "servicio_de_urgencia"
    t.boolean  "alergista"
    t.boolean  "anestesiologia"
    t.boolean  "cardiologia"
    t.boolean  "cirugia"
    t.boolean  "cirugia_reparadora"
    t.boolean  "cirugia_vascular"
    t.boolean  "deportologia"
    t.boolean  "dermatologia"
    t.boolean  "endocrinolgia"
    t.boolean  "fisiatria"
    t.boolean  "gastroenterologia"
    t.boolean  "geriatria"
    t.boolean  "ginecologia"
    t.boolean  "hematologia"
    t.boolean  "infectologia"
    t.boolean  "medicina_general"
    t.boolean  "medicina_interna"
    t.boolean  "medicina_intensiva"
    t.boolean  "nefrologia"
    t.boolean  "neonatologia"
    t.boolean  "neumologia"
    t.boolean  "neurocirugia"
    t.boolean  "neurologia"
    t.boolean  "neuropediatria"
    t.boolean  "odontologia"
    t.boolean  "oncologia"
    t.boolean  "otorrinolaringologia"
    t.boolean  "pediatria"
    t.boolean  "psiquiatria"
    t.boolean  "psiquiatria_infantil"
    t.boolean  "reumatologia"
    t.boolean  "traumatologia"
    t.boolean  "urologia"
  end

  add_index "sites", ["provider_id"], name: "index_sites_on_provider_id", using: :btree

  add_foreign_key "sites", "providers"
end