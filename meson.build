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

meson.add_install_script('meson/post_install.py')

subdir('data')
