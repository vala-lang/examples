/*
 * SPDX-License-Identifier: GPL-2.0-or-later
 * SPDX-FileCopyrightText: 2023 Your Organization (https://yourwebsite.com)
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
        var headerbar = new Gtk.HeaderBar () {
            show_title_buttons = true
        };

        var secondary_click_gesture = new Gtk.GestureClick () {
            button = Gdk.BUTTON_SECONDARY
        };

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        box.add_controller (secondary_click_gesture);

        var menu = new Menu ();
        menu.append ("Quit", "app.quit");

        var popover = new Gtk.PopoverMenu.from_model (menu) {
            halign = Gtk.Align.START,
            has_arrow = false,
            position = Gtk.PositionType.BOTTOM
        };
        popover.set_parent (box);

        var main_window = new Gtk.ApplicationWindow (this) {
            child = box,
            default_height = 300,
            default_width = 300,
            title = "MyApp",
            titlebar = headerbar
        };
        main_window.present ();

        secondary_click_gesture.released.connect ((n_press, x, y) => {
            var rect = Gdk.Rectangle () {
                x = (int) x,
                y = (int) y
            };

            popover.pointing_to = rect;
            popover.popup ();
        });
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
