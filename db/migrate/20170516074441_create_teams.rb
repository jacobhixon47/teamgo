class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.column :name, :string
      t.column :admin_ids, :integer, array: true, default: []

      t.timestamps
    end
  end
end
