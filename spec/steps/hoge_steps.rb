# -*- encoding : utf-8 -*-

step 'トップページを表示する' do
  visit '/'
end

step '画面にひげろぐと表示されていること' do
  expect(page).to have_content('ひげろぐ')
end

step '「Chefでrbenvを使ってRubyをインストールするCookbookを書いた」をクリックする' do
  first(:link, "Chefでrbenvを使ってRubyをインストールするCookbookを書いた")
end

step '画面に「rbnev-install-rubies」と表示されていること' do
  expect(page).to have_content('rbenv-install-rubies')
end
