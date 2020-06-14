project('org.valadoc.examples', 'vala', 'c')

gnome = import('gnome')
i18n = import('i18n')


executable(
    meson.project_name(),
    'src/Application.vala',
    'src/Enums.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0')
    ]
)

