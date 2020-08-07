module ApplicationHelper
  include Pagy::Frontend

  def human_boolean(boolean)
      boolean ? '<i class="far fa-check-circle fa-2x" style="color:green"></i>' : '<i class="far fa-times-circle fa-2x" style="color:red"></i>'
  end
end
