# I18nライブラリに訳文の探索場所を指示する
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb, yml}')]
I18n.available_locales = [:en, :ja]
I18n.default_locale = :ja
