## Building, Testing, and Installation

Run `flatpak-builder` to configure the build environment, download dependencies, build, and install

    flatpak-builder build myapp.yml --user --install --force-clean --install-deps-from=appcenter

execute with `io.github.myteam.myapp`

    flatpak run io.github.myteam.myapp
