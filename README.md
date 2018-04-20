# Omniauth::Fedid

This gem contains the FEDID strategy for OmniAuth.

How To Use It
-------------

If you are using rails, you need to add the gem to your `Gemfile`:

    gem 'omniauth-fedid'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :fedid_oauth, 'client_id', 'secret', scope: 'scopes', client_options: { site: 'site' }
    end
OR 

Inside Devise (optional if using devise gem)
`config/initializers/devise.rb`:

    config.omniauth 
      :fedid_oauth,
        'client_id',
        'secret',
        scope: 'scope',
        client_options: {
          site: 'site'
        }
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fedid-oauth. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
