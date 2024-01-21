set background=dark
let g:colors_name="darcula-solid"
lua package.loaded['darcula-solid.darcula-solid'] = nil
lua require('lush')(require('darcula-solid.darcula-solid'))
