class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,        null: false
      t.integer    :delivery_source_id, null: false
      t.string     :cities,             null: false
      t.string     :address,            null: false
      t.string     :building_name,      null: false
      t.string     :phone_number,       null: false
      t.references :buy,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
