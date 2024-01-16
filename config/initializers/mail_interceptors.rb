Rails.application.configure do
  config.action_mailer.interceptors = %w[SandboxEmailInterceptor]
end
