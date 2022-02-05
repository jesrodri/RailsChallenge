class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.string :num_type
      t.boolean :main_number
      t.belongs_to :contact
      t.references :contact

      t.timestamps
    end
  end
end
