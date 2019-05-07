class CreateDatabase < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.integer :invite_id
      t.string :name, null: false
      t.string :email
    end
    create_table :invites do |t|
      t.integer :invites, default: 0, null: false
      t.integer :coming, default: 0
      t.text :people
      t.text :comments
      t.boolean :confirmed
    end
  end
end
