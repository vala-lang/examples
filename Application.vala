public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.yourusername.yourrepositoryname",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var button_hello = new Gtk.Button.with_label ("Click me!") {
            margin_top = 12,
            margin_bottom = 12,
            margin_start = 12,
            margin_end = 12
        };

        var main_window = new Gtk.ApplicationWindow (this) {
            child = button_hello,
            default_height = 300,
            default_width = 300,
            title = "Hello World"
        };
        main_window.present ();

        button_hello.clicked.connect (() => {
            button_hello.label = "Hello World!";
            button_hello.sensitive = false;
        });
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
