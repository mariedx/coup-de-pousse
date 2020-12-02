class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :message_contact
      t.belongs_to :guest, index: true
      t.belongs_to :host, index: true
      t.belongs_to :garden, index: true

      t.timestamps
    end
  end
end
