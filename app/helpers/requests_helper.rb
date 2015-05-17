module RequestsHelper
  def location_name
    "#{controller.controller_name}_#{action_name}"
  end

  def body_attrs
    attrs = {}
    attrs[:class] = location_name
    attrs
  end
end
