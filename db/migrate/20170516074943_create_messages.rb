class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.column :content, :text
      t.column :user_id, :integer
      t.column :channel_id, :integer

      t.timestamps
    end
  end
end
