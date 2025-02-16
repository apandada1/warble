/*
 * Copyright (c) 2022 Andrew Vojak (https://avojak.com)
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
 * Authored by: Andrew Vojak <andrew.vojak@gmail.com>
 */

public class Warble.Widgets.Keyboard : Gtk.Grid {

    public const char[] ROW_1_LETTERS = {'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'};
    public const char[] ROW_2_LETTERS = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'};
    public const char[] ROW_3_LETTERS = {'Z', 'X', 'C', 'V', 'B', 'N', 'M'};

    private Gee.Map<char, Warble.Widgets.Key> keys = new Gee.HashMap<char, Warble.Widgets.Key> ();

    public Keyboard () {
        Object (
            expand: true,
            orientation: Gtk.Orientation.VERTICAL,
            halign: Gtk.Align.CENTER,
            margin: 8
        );
    }

    construct {
        var row_1_grid = create_row (ROW_1_LETTERS);
        var row_2_grid = create_row (ROW_2_LETTERS);
        var row_3_grid = create_row (ROW_3_LETTERS, true);

        attach (row_1_grid, 0, 0);
        attach (row_2_grid, 0, 1);
        attach (row_3_grid, 0, 2);
    }

    private Gtk.Grid create_row (char[] letters, bool include_control_keys = false) {
        var row_grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.HORIZONTAL,
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.END,
            hexpand = true
        };
        if (include_control_keys) {
            Warble.Widgets.ControlKey return_key = new Warble.Widgets.ControlKey ("Enter");
            return_key.clicked.connect (() => {
                return_key_clicked ();
            });
            row_grid.add (return_key);
        }
        foreach (char letter in letters) {
            Warble.Widgets.Key key = new Warble.Widgets.Key (letter);
            key.clicked.connect ((letter) => {
                key_clicked (letter);
            });
            keys.set (letter, key);
            row_grid.add (key);
        }
        if (include_control_keys) {
            Warble.Widgets.ControlKey backspace_key = new Warble.Widgets.ControlKey ("⌫");
            backspace_key.clicked.connect (() => {
                backspace_key_clicked ();
            });
            row_grid.add (backspace_key);
        }
        return row_grid;
    }

    public Warble.Models.State get_key_state (char letter) {
        return keys.get (letter).state;
    }

    public void update_key_state (char letter, Warble.Models.State new_state) {
        keys.get (letter).state = new_state;
    }

    public signal void key_clicked (char letter);
    public signal void return_key_clicked ();
    public signal void backspace_key_clicked ();

}
