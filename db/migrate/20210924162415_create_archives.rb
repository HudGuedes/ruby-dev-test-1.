class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.string :title
      t.binary :value
      t.references :directory

      t.timestamps
    end
  end
end
