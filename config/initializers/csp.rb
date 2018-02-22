SecureHeaders::Configuration.default do |config|
  config.csp = {
    report_only: Rails.env.production?, # default: false
    preserve_schemes: true, # default: false.
    default_src: %w(*), # all allowed in the beginning
    script_src: %w('self', 'https://maxcdn.bootstrapcdn.com','https://ajax.googleapis.com'),
    connect_src: %w('self'),
    style_src: %w('self','unsafe-inline','https://maxcdn.bootstrapcdn.com','https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'),
    report_uri: ["/csp_report?report_only=#{Rails.env.production?}"]
  }
end