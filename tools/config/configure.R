# Prepare your package for installation here.
# Use 'define()' to define configuration variables.
# Use 'configure_file()' to substitute configuration values.

configure_file("src/Makevars.win")
configure_file("src/Makevars.in")
