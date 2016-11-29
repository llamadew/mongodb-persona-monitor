require 'base64'
require 'RMagick'
include Magick


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :sprockets

set :data_dir, 'data'

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
data.personas.personas.each do |persona|
  slug = persona.display_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  persona.slug = slug + '.html'
  proxy "/#{slug}.html", "/detail.html", :locals => {
    :persona_name => persona.display_name,
    :persona_portrait => persona.portrait,
    :persona_title => persona.title,
    :persona_slug => persona.slug,
    :persona_objective => persona.objective,
    :persona_tools => persona.tools,
    :persona_behaviors => persona.behaviors,
    :persona_frustrations => persona.frustrations,
    :persona_quote => persona.quote,
    :persona_attribution => persona.attribution,
    :persona_needs => persona.needs },
    :ignore => true
end
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def base64_image(name)
    path = "source/#{name}"
    img  = Magick::Image::read(path)[0]
    img.resize_to_fit!(20)

    data = Base64.encode64(img.to_blob)

    str = "background-image: url('data:image/jpeg;base64,#{data}');"
    str.gsub!(/\n/, '')

    end

    def next_persona_link(slug)
      persona_arr = data.personas.personas

      persona_index = data.personas.personas.find_index {|p| p.slug == slug}
      previous_persona = persona_arr[persona_index - 1]
      next_persona = persona_arr[persona_index + 1] || persona_arr[0]

      [previous_persona, next_persona]

    end

end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
