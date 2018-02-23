SecureHeaders::Configuration.default do |config|
    config.csp = {
      default_src: Rails.env.production? ? %w(https: 'self') : %w(http: 'self' 'unsafe-inline'),
      connect_src: %w(
        'self'
      ),
      font_src: %w(
        'self'
        https://maxcdn.bootstrapcdn.com
        https://fonts.gstatic.com
        https://cdnjs.cloudflare.com
        https://fonts.googleapis.com http://maxcdn.bootstrapcdn.com
        https://localhost:3000
      ),
      img_src: %w(
        'self'
        https://hustad.s3-us-west-1.amazonaws.com
      ),
      script_src: %w(
        'self'
        'unsafe-inline'
        http://localhost:3000/assets/ajax-loader.gif
        https://cdnjs.cloudflare.com
        https://fonts.googleapis.com
        https://maxcdn.bootstrapcdn.com
        https://jquery.com
        https://localhost:3000
        fonts.gstatic.com),
      style_src: %w(
				'self'
				https://fonts.googleapis.com
				https://maxcdn.bootstrapcdn.com
        https://localhost:3000
        https://jquery.com
        https://cdnjs.cloudflare.com
      )
    }
    # Use the following if you have CSP issues locally with 
    # tools like webpack-dev-server
    if !Rails.env.production?
      config.csp[:connect_src] << "*"
    end
  end