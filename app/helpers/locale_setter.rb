module LocaleSetter
	def self.from_param(param)
    if param
      locale = param.downcase.to_sym
      if I18n.available_locales.include?(locale)
        locale
      else
        false
      end
    end
  end

  def self.from_http(headers)
    headers_locale(headers) || :en
  end

  def self.headers_locale(accepts)
    accepts.downcase.split("-").first.to_sym
  end
end
