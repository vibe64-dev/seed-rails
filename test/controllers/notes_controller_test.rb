require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "home shows the form and saved notes" do
    get root_path

    assert_response :success
    assert_select "form[action=?] textarea[name=?]", notes_path, "note[body]"
    assert_select ".notes li", text: /Remember the milk/
  end

  test "posting a note saves it and returns home" do
    assert_difference -> { Note.count }, 1 do
      post notes_path, params: { note: { body: "Buy bread" } }
    end

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".notes li", text: /Buy bread/
  end

  test "an empty note is rejected" do
    assert_no_difference -> { Note.count } do
      post notes_path, params: { note: { body: "" } }
    end

    assert_response :unprocessable_content
    assert_select ".error", text: /can't be blank/
  end

  test "posting requires the form's authenticity token" do
    with_forgery_protection do
      assert_no_difference -> { Note.count } do
        post notes_path, params: { note: { body: "Forged" } }
      end
      assert_response :unprocessable_content

      get root_path
      token = css_select("input[name=authenticity_token]").first["value"]
      assert_difference -> { Note.count }, 1 do
        post notes_path, params: { authenticity_token: token, note: { body: "Genuine" } }
      end
      assert_redirected_to root_path
    end
  end

  test "home shows the signed-in account" do
    sign_in_as users(:one)

    get root_path

    assert_select ".topbar", text: /one@example.com/
  end

  private
    def with_forgery_protection
      original = ActionController::Base.allow_forgery_protection
      ActionController::Base.allow_forgery_protection = true
      yield
    ensure
      ActionController::Base.allow_forgery_protection = original
    end
end
