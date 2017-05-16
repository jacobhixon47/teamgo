class CreateTeamMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_memberships do |t|
      t.column :user_id, :integer
      t.column :team_id, :integer

      t.timestamps
    end
  end
end
