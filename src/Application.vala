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

    protected override void activate () {
        var headerbar = new Gtk.HeaderBar () {
            show_title_buttons = true
        };

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300,
            title = "MyApp",
            titlebar = headerbar
        };
        main_window.present ();
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
