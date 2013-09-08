helpers do
  def asset_path file
    if settings.development?
      file
    else
      settings.manifest[file]
    end
  end
end
