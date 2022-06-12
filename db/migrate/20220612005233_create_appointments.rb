class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.text :description
      t.boolean :completed, default: false
      t.text :diagnosis, default: "There is no diagnosis yet. Wait please for your doctor's appointment."
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
