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
        quit_action.activate.connect (quit);
    }

    protected override void activate () {
        var notify_button = new Gtk.Button.with_label ("Notify");

        var replace_button = new Gtk.Button.with_label ("Replace");

        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 12) {
            margin_top = 12,
            margin_end = 12,
            margin_bottom = 12,
            margin_start = 12
        };
        box.append (notify_button);
        box.append (replace_button);

        var headerbar = new Gtk.HeaderBar () {
            show_title_buttons = true
        };

        var main_window = new Gtk.ApplicationWindow (this) {
            child = box,
            default_height = 300,
            default_width = 300,
            title = "MyApp",
            titlebar = headerbar
        };
        main_window.present ();

        notify_button.clicked.connect (() => {
            var notification = new Notification ("Hello World");
            notification.set_body ("This is my first notification!");
            notification.set_icon (new ThemedIcon ("process-completed"));
            notification.set_priority (NotificationPriority.URGENT);
            notification.add_button ("Quit", "app.quit");

            send_notification (null, notification);
        });

        replace_button.clicked.connect (() => {
            var notification = new Notification ("Hello Again");
            notification.set_body ("This is my second Notification!");

            send_notification ("update", notification);
        });
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
