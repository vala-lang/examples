/*
* Copyright 2020 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <author@example.com>
*/

public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "io.github.myteam.myapp",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    public override void startup () {
        base.startup ();

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit",  {"<Control>q", "<Control>w"});
        quit_action.activate.connect (quit);
    }

    protected override void activate () {
        var button = new Gtk.Button.from_icon_name ("process-stop") {
            action_name = "app.quit",
            tooltip_markup = Granite.markup_accel_tooltip (
                get_accels_for_action ("app.quit"),
                "Quit"
            )
        };
        button.add_css_class (Granite.STYLE_CLASS_LARGE_ICONS);

        var headerbar = new Gtk.HeaderBar () {
            show_title_buttons = true
        };
        headerbar.pack_start (button);

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "Actions",
            titlebar = headerbar
        };
        main_window.present ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
