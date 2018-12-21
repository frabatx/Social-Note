class CreatejoinTableUsersNotecollections < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :notecollections do |t|
      # t.index [:user_id, :notecollection_id]
      # t.index [:notecollection_id, :user_id]
    end
  end
end
