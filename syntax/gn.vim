" Vim syntax file for GN files
" Language:     GN (Generate Ninja)
" Maintainer:   Kal Conley
" URL:          https://github.com/c0nk/vim-gn
" Last Change:  24 April 2016

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match gnComment "#.*$" contains=gnTodo,@Spell

syn keyword gnBoolean false true
syn match gnInteger /-\?\<\d\+\>/
syn region gnString start=/"/ skip=/\\\\\|\\"/ end=/"/ oneline contains=gnEscape,gnVarSubst
syn match gnEscape +\\["$\\]+ contained
syn match gnEscape "\$0x\x\x" contained
syn match gnVarSubst "\$\h\w*" contained
syn match gnVarSubst "\${\h\w*}" contained

syn keyword gnConditional if else

" Target declarations
syn keyword gnTargetDecl action
syn keyword gnTargetDecl action_foreach
syn keyword gnTargetDecl bundle_data
syn keyword gnTargetDecl copy
syn keyword gnTargetDecl create_bundle
syn keyword gnTargetDecl executable
syn keyword gnTargetDecl group
syn keyword gnTargetDecl loadable_module
syn keyword gnTargetDecl shared_library
syn keyword gnTargetDecl source_set
syn keyword gnTargetDecl static_library
syn keyword gnTargetDecl target

" Buildfile functions
syn keyword gnFunction assert
syn keyword gnFunction config
syn keyword gnFunction declare_args
syn keyword gnFunction defined
syn keyword gnFunction exec_script
syn keyword gnFunction foreach
syn keyword gnFunction forward_variables_from
syn keyword gnFunction get_label_info
syn keyword gnFunction get_path_info
syn keyword gnFunction get_target_outputs
syn keyword gnFunction getenv
syn keyword gnFunction import
syn keyword gnFunction print
syn keyword gnFunction process_file_template
syn keyword gnFunction read_file
syn keyword gnFunction rebase_path
syn keyword gnFunction set_default_toolchain
syn keyword gnFunction set_defaults
syn keyword gnFunction set_sources_assignment_filter
syn keyword gnFunction template
syn keyword gnFunction tool
syn keyword gnFunction toolchain
syn keyword gnFunction toolchain_args
syn keyword gnFunction write_file

" Built-in predefined variables
syn keyword gnVariable current_cpu
syn keyword gnVariable current_os
syn keyword gnVariable current_toolchain
syn keyword gnVariable default_toolchain
syn keyword gnVariable host_cpu
syn keyword gnVariable host_os
syn keyword gnVariable python_path
syn keyword gnVariable root_build_dir
syn keyword gnVariable root_gen_dir
syn keyword gnVariable root_out_dir
syn keyword gnVariable target_cpu
syn keyword gnVariable target_gen_dir
syn keyword gnVariable target_os
syn keyword gnVariable target_out_dir

" Variables you set in targets
syn keyword gnVariable all_dependent_configs
syn keyword gnVariable allow_circular_includes_from
syn keyword gnVariable arflags
syn keyword gnVariable args
syn keyword gnVariable asmflags
syn keyword gnVariable assert_no_deps
syn keyword gnVariable bundle_executable_dir
syn keyword gnVariable bundle_plugins_dir
syn keyword gnVariable bundle_resources_dir
syn keyword gnVariable bundle_root_dir
syn keyword gnVariable cflags
syn keyword gnVariable cflags_c
syn keyword gnVariable cflags_cc
syn keyword gnVariable cflags_objc
syn keyword gnVariable cflags_objcc
syn keyword gnVariable check_includes
syn keyword gnVariable complete_static_lib
syn keyword gnVariable configs
syn keyword gnVariable console
syn keyword gnVariable data
syn keyword gnVariable data_deps
syn keyword gnVariable defines
syn keyword gnVariable depfile
syn keyword gnVariable deps
syn keyword gnVariable include_dirs
syn keyword gnVariable inputs
syn keyword gnVariable ldflags
syn keyword gnVariable lib_dirs
syn keyword gnVariable libs
syn keyword gnVariable output_dir
syn keyword gnVariable output_extension
syn keyword gnVariable output_name
syn keyword gnVariable output_prefix_override
syn keyword gnVariable outputs
syn keyword gnVariable precompiled_header
syn keyword gnVariable precompiled_source
syn keyword gnVariable public
syn keyword gnVariable public_configs
syn keyword gnVariable public_deps
syn keyword gnVariable response_file_contents
syn keyword gnVariable script
syn keyword gnVariable sources
syn keyword gnVariable testonly
syn keyword gnVariable visibility
syn keyword gnVariable write_runtime_deps

syn keyword gnTodo FIXME NOTE NOTES TODO XXX contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gn_syn_inits")
  if version < 508
    let did_gn_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gnComment Comment

  HiLink gnBoolean Boolean
  HiLink gnInteger Number
  HiLink gnString String
  HiLink gnEscape Special
  HiLink gnVarSubst Special

  HiLink gnConditional Conditional

  HiLink gnTargetDecl Type
  HiLink gnFunction Macro
  HiLink gnVariable Statement

  HiLink gnTodo Todo

  delcommand HiLink
endif

let b:current_syntax = "gn"
