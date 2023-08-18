# project name and programming language
project('io.github.myteam.myapp', 'vala', 'c')

# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    meson.project_name(),
    'src' / 'Application.vala',
    dependencies: [
        dependency('gtk4')
    ],
    install: true
)

gnome = import('gnome')
gnome.post_install(glib_compile_schemas: true)

subdir('data')
