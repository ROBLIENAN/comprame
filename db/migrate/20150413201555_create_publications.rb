class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.float :precio
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
