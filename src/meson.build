conf_data = configuration_data()
conf_data.set('APP_ID', application_id)
conf_data.set('APP_NAME', application_name)
conf_data.set('VERSION', meson.project_version())
conf_data.set('PKG_DATA_DIR', join_paths(get_option('prefix'), get_option('datadir'), meson.project_name()))

config_header = configure_file(
    input: 'config.vala.in',
    output: 'config.vala',
    configuration: conf_data
)

warble_files = files(
    join_paths('ActionManager.vala'),
    join_paths('Application.vala'),
    join_paths('ColorPalette.vala'),
    join_paths('MainWindow.vala'),
    join_paths('MainLayout.vala'),
    join_paths('Models', 'Dictionary.vala'),
    join_paths('Models', 'Difficulty.vala'),
    join_paths('Models', 'State.vala'),
    join_paths('Widgets', 'Dialogs', 'DefeatDialog.vala'),
    join_paths('Widgets', 'Dialogs', 'DifficultyChangeWarningDialog.vala'),
    join_paths('Widgets', 'Dialogs', 'NewGameConfirmationDialog.vala'),
    join_paths('Widgets', 'Dialogs', 'GameplayStatisticsDialog.vala'),
    join_paths('Widgets', 'Dialogs', 'RulesDialog.vala'),
    join_paths('Widgets', 'Dialogs', 'VictoryDialog.vala'),
    join_paths('Widgets', 'GameArea.vala'),
    join_paths('Widgets', 'HeaderBar.vala'),
    join_paths('Widgets', 'Key.vala'),
    join_paths('Widgets', 'ControlKey.vala'),
    join_paths('Widgets', 'Keyboard.vala'),
    join_paths('Widgets', 'Row.vala'),
    join_paths('Widgets', 'Square.vala'),
    join_paths('Widgets', 'GameplayStatistics.vala')
)

# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    application_id,
    warble_files,
    config_header,
    # css_gresource,
    dependencies: [
        dependency('gtk+-3.0', version: '>= 3.6.4'),
        dependency('gee-0.8', version: '>= 0.8.5'),
        dependency('glib-2.0', version: '>= 2.30.0'),
        dependency('granite', version: '>= 0.6.0'),
        dependency('libhandy-1', version: '>=1.0.0')
    ],
    vala_args: vala_args,
    install: true
)
