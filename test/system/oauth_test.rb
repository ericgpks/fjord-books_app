require 'application_system_test_case'

class OAuthTest < ApplicationSystemTestCase
  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, { uid: '12345', info: { name: 'Alice', email: 'alice@example.com' } })
  end

  test 'GitHub sign up' do
    visit root_path
    assert_css 'h2', text: 'ログイン'
    click_link 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'
    assert_text 'alice@example.com としてログイン中'
    click_link 'ユーザ'
    assert_css 'h1', text: 'ユーザ'
    within 'table' do
      assert_text 'alice@example.com'
      assert_text 'Alice'
    end
  end
end