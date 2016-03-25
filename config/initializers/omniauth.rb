Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Hk7D1yaIsYoAJ0WEYJwkDKcDl' , ' fPI5BUPGkxWrli3FxObx0XW7E7OvWjqlhwwz1UVKTzA4Wd6KTK'
  provider :facebook, '556529944520835', 'ee278366cabc40268604c691a00fa13e',
           scope: 'public_profile', info_fields: 'id,name,link'
end