# frozen_string_literal: true

require 'prawn/table'

class PassengersPDF < Prawn::Document
  # what is the name of this file?
  def initialize(passengers, filters)
    super(page_layout: :landscape, page_size: 'TABLOID')
    font_families.update(
      'DejaVu Sans' => {
        normal: Rails.root.join('app', 'assets', 'fonts', 'DejaVuSans.ttf'),
        bold: Rails.root.join('app', 'assets', 'fonts', 'DejaVuSansBold.ttf')
      }
    )
    font 'DejaVu Sans'
    header(filters)
    passengers_table(passengers)
  end

  def passengers_table(passengers)
    font_size 14
    headers = ['Name', 'Mobility Device', 'Phone', 'Expiration Date', 'Notes']
    passenger_table = passengers.map { |p| passenger_row p }.unshift headers

    table passenger_table, cell_style: { font: 'DejaVu Sans' } do
      row(0).font_style = :bold
    end
  end

  def passenger_row(passenger)
    name = passenger.name
    mobility_device = passenger.mobility_device.try(:name)
    phone = passenger.phone
    expiration = passenger.expiration_display
    note = passenger.note
    [name, mobility_device, phone, expiration, note]
  end

  def header(filters)
    font_size 30
    date = Time.now.strftime('%m/%d/%Y')
    title = (filters + ['Passengers', date]).map(&:capitalize).join(' ')
    text title, style: :bold, size: 30
    move_down 20
  end
end