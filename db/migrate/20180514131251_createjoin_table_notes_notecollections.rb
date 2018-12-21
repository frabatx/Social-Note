class CreatejoinTableNotesNotecollections < ActiveRecord::Migration[5.1]
  def change
    create_join_table :notes, :notecollections do |t|
      # t.index [:note_id, :notecollection_id]
      # t.index [:notecollection_id, :note_id]
    end
  end
end
