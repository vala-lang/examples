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
        var quit_button = new Gtk.Button () {
            action_name = "app.quit",
            child = new Granite.AccelLabel.from_action_name ("Quit", "app.quit")
        };
        quit_button.add_css_class (Granite.STYLE_CLASS_MENUITEM);

        var popover = new Gtk.Popover () {
            child = quit_button
        };
        popover.add_css_class (Granite.STYLE_CLASS_MENU);

        var menu_button = new Gtk.MenuButton () {
            icon_name = "open-menu",
            popover = popover,
            primary = true,
            tooltip_markup = Granite.markup_accel_tooltip ({"F10"}, "Menu")
        };
        menu_button.add_css_class (Granite.STYLE_CLASS_LARGE_ICONS);

        var headerbar = new Gtk.HeaderBar () {
            show_title_buttons = true
        };
        headerbar.pack_end (menu_button);

        var secondary_click_gesture = new Gtk.GestureClick () {
            button = Gdk.BUTTON_SECONDARY
        };

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        box.add_controller (secondary_click_gesture);

        var menu = new Menu ();
        menu.append ("Quit", "app.quit");

        var popover_menu = new Gtk.PopoverMenu.from_model (menu) {
            halign = Gtk.Align.START,
            has_arrow = false,
            position = Gtk.PositionType.BOTTOM
        };
        popover_menu.set_parent (box);

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

            popover_menu.pointing_to = rect;
            popover_menu.popup ();
        });
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
