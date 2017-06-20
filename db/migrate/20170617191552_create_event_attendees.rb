class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.belongs_to :event
      t.belongs_to :attendee
      t.timestamps null: false
    end
  end
end
