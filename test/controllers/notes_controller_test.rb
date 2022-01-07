require_relative '../test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest

  test 'should render notes' do
    get notes_url
    assert_response :success
  end
end