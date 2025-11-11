# frozen_string_literal: true

require 'fileutils'

theme_name = ARGV[0] || abort('Uso: ruby kitty_to_nvim.rb path/al/tema.conf')

kitty_conf = File.expand_path('~/.config/kitty/current-theme.conf')
output_dir = '~/.config/nvim/colors'
output_file = File.expand_path("#{output_dir}/kitty_#{theme_name}.lua")

colors = {}

File.readlines(kitty_conf).each do |line|
  if line =~ /^(foreground|background|color\d{1,2})\s+(#\h{6})/
    key, value = $1, $2.downcase
    colors[key] = value
  end
end

abort("No se encontraron colores en #{kitty_conf}") if colors.empty?

FileUtils.mkdir_p(output_dir)

File.write(output_file, <<~LUA)
  vim.cmd('highlight clear')
  vim.o.background = 'dark'
  vim.g.colors_name = "kitty_#{theme_name}"

  local set = vim.api.nvim_set_hl

  set(0, 'Normal',     { fg = "#{colors['foreground']}", bg = "#{colors['background']}" })
  set(0, 'Comment',    { fg = "#{colors['color8']}" })
  set(0, 'Constant',   { fg = "#{colors['color1']}" })
  set(0, 'Identifier', { fg = "#{colors['color4']}" })
  set(0, 'Statement',  { fg = "#{colors['color3']}" })
  set(0, 'PreProc',    { fg = "#{colors['color5']}" })
  set(0, 'Type',       { fg = "#{colors['color2']}" })
  set(0, 'Special',    { fg = "#{colors['color6']}" })
  set(0, 'Underlined', { fg = "#{colors['color4']}", underline = true })
LUA

puts "‚úÖ Tema generado: #{output_file}"
puts "üëâ √ösalo con: 
