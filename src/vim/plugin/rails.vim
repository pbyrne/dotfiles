" Teach vim-rails about custom directories
let g:rails_projections = {
  \ "app/services/*.rb": {
  \   "command": "service",
  \   "template": "",
  \   "keywords": "",
  \   "test": [
  \     "test/services/{}_test.rb",
  \   ]
  \ },
  \ "app/commands/*.rb": {
  \   "command": "command",
  \   "template": "",
  \   "keywords": "",
  \   "test": [
  \     "test/commands/{}_test.rb",
  \   ]
  \ },
  \ "app/validators/*_validator.rb": {
  \   "command": "validator",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Validator",
  \     "end"
  \   ],
  \   "keywords": "custom validators"
  \ },
  \ "app/uploaders/*_uploader.rb": {
  \   "command": "uploader",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Uploader < Shrine",
  \     "end"
  \   ],
  \   "test": [
  \     "test/uploader/{}_uploader_test.rb",
  \   ],
  \   "keywords": "Shrine uploaders"
  \ },
  \ "app/forms/*_form.rb": {
  \   "command": "form",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Form",
  \     "end"
  \   ],
  \   "test": [
  \     "test/forms/{}_form_test.rb",
  \   ],
  \   "keywords": "form objects"
  \ },
  \ "config/routes/*.rb": {
  \   "command": "route",
  \   "keywords": "routes"
  \ },
  \ "test/factories/*.rb": {
  \   "command": "factory",
  \   "keywords": "factory"
  \ },
  \ "app/observers/*_observer.rb": {
  \   "command": "observer",
  \   "template": [
  \     "class {camelcase|capitalize|colons}Observer",
  \     "end"
  \   ],
  \   "keywords": "observers",
  \   "test": [
  \     "test/observers/{}_test.rb",
  \   ]
  \ },
  \ "app/form_builders/*_form_builder.rb": {
  \   "command": "form_builder",
  \   "template": [
  \     "class {camelcase|capitalize|colons}FormBuilder < ActionView::Helpers::FormBuilder",
  \     "end"
  \   ],
  \   "keywords": "form builders",
  \   "test": [
  \     "test/form_builders/{}_form_builder_test.rb",
  \   ]
  \ },
  \ "app/delivery_methods/*.rb": {
  \   "command": "delivery_method",
  \   "keywords": "delivery methods"}}

" Lifted (along with completion which uses it below) from https://blog.semanticart.com/2017/11/14/rails-route-completion-with-fzf-in-vim/
function! s:parse_route(selected)
  let l:squished = substitute(join(a:selected), '^\s\+', '', '')
  return split(l:squished)[0] . '_path'
endfunction


