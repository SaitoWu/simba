helpers do
  include Sprockets::Helpers

  def js file
    file = "js/#{file}.js"
    %Q|<script src='#{asset_path file}'></script>|
  end

  def css file
    file = "css/#{file}.css"
    %Q|<link rel='stylesheet' href='#{asset_path file}'/>|
  end

end
