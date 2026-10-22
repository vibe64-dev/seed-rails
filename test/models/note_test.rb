require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "requires a body" do
    note = Note.new(body: "  ")

    assert_not note.valid?
    assert_includes note.errors[:body], "can't be blank"
  end

  test "limits the body to 500 characters" do
    assert Note.new(body: "a" * 500).valid?
    assert_not Note.new(body: "a" * 501).valid?
  end

  test "lists the newest notes first" do
    newer = Note.create!(body: "Newer")

    assert_equal newer, Note.recent.first
  end
end
