module EnumI18nHelper
  def enum_l(model, enum)
    enum_i18n(model.class, enum, model.send(enum))
  end
end
