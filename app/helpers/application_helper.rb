module ApplicationHelper
  def r_flash
    output = ''
    flash.each do |type, message|
      next if message.blank?

      type = :success if type.to_sym == :notice
      type = :error if type.to_sym == :alert
      next unless SemanticFlashHelper::ALERT_TYPES.include?(type.to_sym)

      output += r_flash_container(type, message)
    end

    raw(output)
  end

  def r_flash_container(type, message)
    render(partial: 'layouts/toast', locals: {message: message, type: type})
  end
end
