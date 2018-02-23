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
      ),
      img_src: %w(
        'self'
        https://hustad.s3-us-west-1.amazonaws.com
      ),
      script_src: %w(
        'self'
        'unsafe-inline'
        https://cdnjs.cloudflare.com),
      style_src: %w(
				'self'
				https://fonts.googleapis.com
				http://maxcdn.bootstrapcdn.com
        https://www.backpropagate.io/assets/font-awesome.css
      )
    }
    # Use the following if you have CSP issues locally with 
    # tools like webpack-dev-server
    if !Rails.env.production?
      config.csp[:connect_src] << "*"
    end
  end