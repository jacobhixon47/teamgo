class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.column :name, :string
      t.column :team_id, :integer
      t.column :is_public, :boolean
      t.column :member_ids, :integer, array: true, default: []

      t.timestamps
    end
  end
end
