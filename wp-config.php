<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'FE1.M:Ra#?Ny3^}Lj!_.;=>@rXp(>^yZjv1],E((rm8i2tiQfz`D.NX`!|!+Tt=Y' );
define( 'SECURE_AUTH_KEY',  'J?U[K/S{%f#KvBm!%%pm&]^r%H<K3h}}^~kHt,@WbWFIg+7Ts?*&V,XDiYkL-A_=' );
define( 'LOGGED_IN_KEY',    '$qWt2EBn>E3h!M@sjD9r(?sq&WH}(1v0HHyC_(YvSYo^?eR_Y(-4m~*^n!jz]_#t' );
define( 'NONCE_KEY',        'l`,PdM{eC_i+:t!+#P~95,m)Rp#3O*.yAoMMY1B~BU^aTfHfcB;|H7:B(6,fW7s}' );
define( 'AUTH_SALT',        'D|{#8#WHVjVUIE4|$q%8.dV-x&t}d(&`W3M:J LvQplj3gM.:@wxO-l<^]$7~uA{' );
define( 'SECURE_AUTH_SALT', '$DBti$v|%y#64$kP$w=m??zHk9FUW5r<zrf3De6YXJtp+gvYB_S~?=`))OPtoual' );
define( 'LOGGED_IN_SALT',   ';[WeVmRw^@~TBIfj(X+,4PUp2Cuib-|y~C7n r^u,3I_7wm=XCG|v.>=/w2w=+6Q' );
define( 'NONCE_SALT',       '?RC7lL.b=!G@7sM;^):7H3Xu4Z`,<X8 =r%&$V=LyJ2F=1IP?}1Kk8qA&gooXj!k' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
