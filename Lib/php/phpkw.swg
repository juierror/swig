/* -----------------------------------------------------------------------------
 * phpkw.swg
 * ----------------------------------------------------------------------------- */

/* Keyword (case insensitive) */
#define PHPKW(x) %keywordwarn("'" `x` "' is a PHP keyword, renaming to 'c_" `x` "'",sourcefmt="%(lower)s",rename="c_%s") `x`

/* Keyword, except ok as a function */
#define PHPKW_ok_as_function(x) %keywordwarn("'" `x` "' is a PHP keyword, renaming to 'c_" `x` "'",%$not %$isfunction,sourcefmt="%(lower)s",rename="c_%s") `x`

/* Class (case insensitive) */
#define PHPCN(x) %keywordwarn("'" `x` "' is a PHP reserved class name, renaming to 'c_" `x` "'",%$isclass,sourcefmt="%(lower)s",rename="c_%s") `x`

/* Constant (case insensitive) */
#define PHPBN1a(x) %namewarn(%warningmsg(SWIGWARN_PARSE_BUILTIN_NAME, "enum conflicts with a built-in constant '"`x`"' in PHP"),%$isenumitem,sourcefmt="%(lower)s") `x`
#define PHPBN1b(x) %namewarn(%warningmsg(SWIGWARN_PARSE_BUILTIN_NAME, "constant conflicts with a built-in constant '"`x`"' in PHP"),%$isconstant,sourcefmt="%(lower)s") `x`
%define PHPBN1(X)
 PHPBN1a(X); PHPBN1b(X)
%enddef

/* Constant (case sensitive) */
#define PHPBN2a(x) %namewarn(%warningmsg(SWIGWARN_PARSE_BUILTIN_NAME, "enum conflicts with a built-in constant '"`x`"' in PHP"),%$isenumitem) `x`
#define PHPBN2b(x) %namewarn(%warningmsg(SWIGWARN_PARSE_BUILTIN_NAME, "constant conflicts with a built-in constant '"`x`"' in PHP"),%$isconstant) `x`
%define PHPBN2(X)
 PHPBN2a(X); PHPBN2b(X)
%enddef

#define PHPFN(x) %keywordwarn("'" `x` "' is a PHP built-in function, renaming to 'c_" `x` "'",sourcefmt="%(lower)s",%$isfunction,%$not %$ismember,rename="c_%s") `x`

/* From: http://php.net/manual/en/reserved.keywords.php
 * "You cannot use any of the following words as constants, class names,
 * function or method names. Using them as variable names is generally OK, but
 * could lead to confusion."
 */
/* Check is case insensitive - these *MUST* be listed in lower case here */
PHPKW(abstract);
PHPKW(and);
PHPKW(as);
PHPKW(break);
PHPKW(callable);
PHPKW(case);
PHPKW(catch);
PHPKW(class);
PHPKW(clone);
PHPKW(const);
PHPKW(continue);
PHPKW(declare);
PHPKW(default);
PHPKW(do);
PHPKW(else);
PHPKW(elseif);
PHPKW(enddeclare);
PHPKW(endfor);
PHPKW(endforeach);
PHPKW(endif);
PHPKW(endswitch);
PHPKW(endwhile);
PHPKW(extends);
PHPKW(final);
PHPKW(finally);
PHPKW(fn); // as of PHP 7.4
PHPKW(for);
PHPKW(foreach);
PHPKW(function);
PHPKW(global);
PHPKW(goto);
PHPKW(if);
PHPKW(implements);
PHPKW(instanceof);
PHPKW(insteadof);
PHPKW(interface);
PHPKW(match); // as of PHP 8.0
PHPKW(namespace);
PHPKW(new);
PHPKW(or);
PHPKW(private);
PHPKW(protected);
PHPKW(public);
PHPKW(static);
PHPKW(switch);
PHPKW(throw);
PHPKW(trait);
PHPKW(try);
PHPKW(use);
PHPKW(var);
PHPKW(while);
PHPKW(xor);
PHPKW(yield);

/* PHP 8.1 made `readonly` a keyword, but (unlike any other keyword it seems)
 * it may still be used as a function name.
 */
PHPKW_ok_as_function(readonly);

// Compile-time "magic" constants
// From: http://php.net/manual/en/reserved.keywords.php
// also at: http://php.net/manual/en/language.constants.predefined.php
/* These *MUST* be listed in lower case here */
PHPKW(__class__);
PHPKW(__dir__);
PHPKW(__file__);
PHPKW(__function__);
PHPKW(__line__);
PHPKW(__method__);
PHPKW(__namespace__);
PHPKW(__trait__);

/* We classify these as built-in names since they conflict, but PHP still runs */

/* Predefined case-insensitive constants */
/* These *MUST* be listed in lower case here */
PHPBN1(null);
PHPBN1(true);
PHPBN1(false);

/* "Core Predefined Constants" from http://php.net/manual/en/reserved.constants.php */
/* These are case sensitive */
PHPBN2(PHP_VERSION);
PHPBN2(PHP_MAJOR_VERSION);
PHPBN2(PHP_MINOR_VERSION);
PHPBN2(PHP_RELEASE_VERSION);
PHPBN2(PHP_VERSION_ID);
PHPBN2(PHP_EXTRA_VERSION);
PHPBN2(PHP_ZTS);
PHPBN2(PHP_DEBUG);
PHPBN2(PHP_MAXPATHLEN);
PHPBN2(PHP_OS);
PHPBN2(PHP_SAPI);
PHPBN2(PHP_EOL);
PHPBN2(PHP_INT_MAX);
PHPBN2(PHP_INT_SIZE);
PHPBN2(PHP_FLOAT_DIG); // Since 7.2.0
PHPBN2(PHP_FLOAT_EPSILON); // Since 7.2.0
PHPBN2(PHP_FLOAT_MIN); // Since 7.2.0
PHPBN2(PHP_FLOAT_MAX); // Since 7.2.0
PHPBN2(DEFAULT_INCLUDE_PATH);
PHPBN2(PEAR_INSTALL_DIR);
PHPBN2(PEAR_EXTENSION_DIR);
PHPBN2(PHP_EXTENSION_DIR);
PHPBN2(PHP_PREFIX);
PHPBN2(PHP_BINDIR);
PHPBN2(PHP_BINARY);
PHPBN2(PHP_MANDIR);
PHPBN2(PHP_LIBDIR);
PHPBN2(PHP_DATADIR);
PHPBN2(PHP_SYSCONFDIR);
PHPBN2(PHP_LOCALSTATEDIR);
PHPBN2(PHP_CONFIG_FILE_PATH);
PHPBN2(PHP_CONFIG_FILE_SCAN_DIR);
PHPBN2(PHP_SHLIB_SUFFIX);
PHPBN2(PHP_FD_SETSIZE); // Since 7.1.0
PHPBN2(E_ERROR);
PHPBN2(E_WARNING);
PHPBN2(E_PARSE);
PHPBN2(E_NOTICE);
PHPBN2(E_CORE_ERROR);
PHPBN2(E_CORE_WARNING);
PHPBN2(E_COMPILE_ERROR);
PHPBN2(E_COMPILE_WARNING);
PHPBN2(E_USER_ERROR);
PHPBN2(E_USER_WARNING);
PHPBN2(E_USER_NOTICE);
PHPBN2(E_RECOVERABLE_ERROR);
PHPBN2(E_DEPRECATED);
PHPBN2(E_USER_DEPRECATED);
PHPBN2(E_ALL);
PHPBN2(E_STRICT);
PHPBN2(__COMPILER_HALT_OFFSET__);
// TRUE, FALSE, NULL are listed on the same page, but are actually
// case-insensitive, whereas all the other constants listed there seem to be
// case-sensitive, so we handle TRUE, FALSE, NULL in PHPBN1.
PHPBN2(PHP_OUTPUT_HANDLER_START);
PHPBN2(PHP_OUTPUT_HANDLER_CONT);
PHPBN2(PHP_OUTPUT_HANDLER_END);
/* Since 7.4.0 (Microsoft Windows only) */
PHPBN2(PHP_WINDOWS_EVENT_CTRL_C);
PHPBN2(PHP_WINDOWS_EVENT_CTRL_BREAK);
/* These don't actually seem to be set (tested on Linux, I guess they're
 * Windows only?) */
PHPBN2(PHP_WINDOWS_NT_DOMAIN_CONTROLLER);
PHPBN2(PHP_WINDOWS_NT_SERVER);
PHPBN2(PHP_WINDOWS_NT_WORKSTATION);
PHPBN2(PHP_WINDOWS_VERSION_BUILD);
PHPBN2(PHP_WINDOWS_VERSION_MAJOR);
PHPBN2(PHP_WINDOWS_VERSION_MINOR);
PHPBN2(PHP_WINDOWS_VERSION_PLATFORM);
PHPBN2(PHP_WINDOWS_VERSION_PRODUCTTYPE);
PHPBN2(PHP_WINDOWS_VERSION_SP_MAJOR);
PHPBN2(PHP_WINDOWS_VERSION_SP_MINOR);
PHPBN2(PHP_WINDOWS_VERSION_SUITEMASK);
/* "Standard Predefined Constants" from http://php.net/manual/en/reserved.constants.php */
PHPBN2(EXTR_OVERWRITE);
PHPBN2(EXTR_SKIP);
PHPBN2(EXTR_PREFIX_SAME);
PHPBN2(EXTR_PREFIX_ALL);
PHPBN2(EXTR_PREFIX_INVALID);
PHPBN2(EXTR_PREFIX_IF_EXISTS);
PHPBN2(EXTR_IF_EXISTS);
PHPBN2(SORT_ASC);
PHPBN2(SORT_DESC);
PHPBN2(SORT_REGULAR);
PHPBN2(SORT_NUMERIC);
PHPBN2(SORT_STRING);
PHPBN2(CASE_LOWER);
PHPBN2(CASE_UPPER);
PHPBN2(COUNT_NORMAL);
PHPBN2(COUNT_RECURSIVE);
PHPBN2(ASSERT_ACTIVE);
PHPBN2(ASSERT_CALLBACK);
PHPBN2(ASSERT_BAIL);
PHPBN2(ASSERT_WARNING);
PHPBN2(ASSERT_QUIET_EVAL);
PHPBN2(CONNECTION_ABORTED);
PHPBN2(CONNECTION_NORMAL);
PHPBN2(CONNECTION_TIMEOUT);
PHPBN2(INI_USER);
PHPBN2(INI_PERDIR);
PHPBN2(INI_SYSTEM);
PHPBN2(INI_ALL);
PHPBN2(INI_SCANNER_NORMAL);
PHPBN2(INI_SCANNER_RAW);
PHPBN2(M_E);
PHPBN2(M_LOG2E);
PHPBN2(M_LOG10E);
PHPBN2(M_LN2);
PHPBN2(M_LN10);
PHPBN2(M_PI);
PHPBN2(M_PI_2);
PHPBN2(M_PI_4);
PHPBN2(M_1_PI);
PHPBN2(M_2_PI);
PHPBN2(M_2_SQRTPI);
PHPBN2(M_SQRT2);
PHPBN2(M_SQRT1_2);
PHPBN2(M_EULER);
PHPBN2(M_LNPI);
PHPBN2(M_SQRT3);
PHPBN2(M_SQRTPI);
PHPBN2(CRYPT_SALT_LENGTH);
PHPBN2(CRYPT_STD_DES);
PHPBN2(CRYPT_EXT_DES);
PHPBN2(CRYPT_MD5);
PHPBN2(CRYPT_BLOWFISH);
PHPBN2(DIRECTORY_SEPARATOR);
PHPBN2(SEEK_SET);
PHPBN2(SEEK_CUR);
PHPBN2(SEEK_END);
PHPBN2(LOCK_SH);
PHPBN2(LOCK_EX);
PHPBN2(LOCK_UN);
PHPBN2(LOCK_NB);
PHPBN2(HTML_SPECIALCHARS);
PHPBN2(HTML_ENTITIES);
PHPBN2(ENT_COMPAT);
PHPBN2(ENT_QUOTES);
PHPBN2(ENT_NOQUOTES);
PHPBN2(INFO_GENERAL);
PHPBN2(INFO_CREDITS);
PHPBN2(INFO_CONFIGURATION);
PHPBN2(INFO_MODULES);
PHPBN2(INFO_ENVIRONMENT);
PHPBN2(INFO_VARIABLES);
PHPBN2(INFO_LICENSE);
PHPBN2(INFO_ALL);
PHPBN2(CREDITS_GROUP);
PHPBN2(CREDITS_GENERAL);
PHPBN2(CREDITS_SAPI);
PHPBN2(CREDITS_MODULES);
PHPBN2(CREDITS_DOCS);
PHPBN2(CREDITS_FULLPAGE);
PHPBN2(CREDITS_QA);
PHPBN2(CREDITS_ALL);
PHPBN2(STR_PAD_LEFT);
PHPBN2(STR_PAD_RIGHT);
PHPBN2(STR_PAD_BOTH);
PHPBN2(PATHINFO_DIRNAME);
PHPBN2(PATHINFO_BASENAME);
PHPBN2(PATHINFO_EXTENSION);
PHPBN2(PATHINFO_FILENAME);
PHPBN2(PATH_SEPARATOR);
PHPBN2(CHAR_MAX);
PHPBN2(LC_CTYPE);
PHPBN2(LC_NUMERIC);
PHPBN2(LC_TIME);
PHPBN2(LC_COLLATE);
PHPBN2(LC_MONETARY);
PHPBN2(LC_ALL);
PHPBN2(LC_MESSAGES);
PHPBN2(ABDAY_1);
PHPBN2(ABDAY_2);
PHPBN2(ABDAY_3);
PHPBN2(ABDAY_4);
PHPBN2(ABDAY_5);
PHPBN2(ABDAY_6);
PHPBN2(ABDAY_7);
PHPBN2(DAY_1);
PHPBN2(DAY_2);
PHPBN2(DAY_3);
PHPBN2(DAY_4);
PHPBN2(DAY_5);
PHPBN2(DAY_6);
PHPBN2(DAY_7);
PHPBN2(ABMON_1);
PHPBN2(ABMON_2);
PHPBN2(ABMON_3);
PHPBN2(ABMON_4);
PHPBN2(ABMON_5);
PHPBN2(ABMON_6);
PHPBN2(ABMON_7);
PHPBN2(ABMON_8);
PHPBN2(ABMON_9);
PHPBN2(ABMON_10);
PHPBN2(ABMON_11);
PHPBN2(ABMON_12);
PHPBN2(MON_1);
PHPBN2(MON_2);
PHPBN2(MON_3);
PHPBN2(MON_4);
PHPBN2(MON_5);
PHPBN2(MON_6);
PHPBN2(MON_7);
PHPBN2(MON_8);
PHPBN2(MON_9);
PHPBN2(MON_10);
PHPBN2(MON_11);
PHPBN2(MON_12);
PHPBN2(AM_STR);
PHPBN2(PM_STR);
PHPBN2(D_T_FMT);
PHPBN2(D_FMT);
PHPBN2(T_FMT);
PHPBN2(T_FMT_AMPM);
PHPBN2(ERA);
PHPBN2(ERA_YEAR);
PHPBN2(ERA_D_T_FMT);
PHPBN2(ERA_D_FMT);
PHPBN2(ERA_T_FMT);
PHPBN2(ALT_DIGITS);
PHPBN2(INT_CURR_SYMBOL);
PHPBN2(CURRENCY_SYMBOL);
PHPBN2(CRNCYSTR);
PHPBN2(MON_DECIMAL_POINT);
PHPBN2(MON_THOUSANDS_SEP);
PHPBN2(MON_GROUPING);
PHPBN2(POSITIVE_SIGN);
PHPBN2(NEGATIVE_SIGN);
PHPBN2(INT_FRAC_DIGITS);
PHPBN2(FRAC_DIGITS);
PHPBN2(P_CS_PRECEDES);
PHPBN2(P_SEP_BY_SPACE);
PHPBN2(N_CS_PRECEDES);
PHPBN2(N_SEP_BY_SPACE);
PHPBN2(P_SIGN_POSN);
PHPBN2(N_SIGN_POSN);
PHPBN2(DECIMAL_POINT);
PHPBN2(RADIXCHAR);
PHPBN2(THOUSANDS_SEP);
PHPBN2(THOUSEP);
PHPBN2(GROUPING);
PHPBN2(YESEXPR);
PHPBN2(NOEXPR);
PHPBN2(YESSTR);
PHPBN2(NOSTR);
PHPBN2(CODESET);
PHPBN2(LOG_EMERG);
PHPBN2(LOG_ALERT);
PHPBN2(LOG_CRIT);
PHPBN2(LOG_ERR);
PHPBN2(LOG_WARNING);
PHPBN2(LOG_NOTICE);
PHPBN2(LOG_INFO);
PHPBN2(LOG_DEBUG);
PHPBN2(LOG_KERN);
PHPBN2(LOG_USER);
PHPBN2(LOG_MAIL);
PHPBN2(LOG_DAEMON);
PHPBN2(LOG_AUTH);
PHPBN2(LOG_SYSLOG);
PHPBN2(LOG_LPR);
PHPBN2(LOG_NEWS);
PHPBN2(LOG_UUCP);
PHPBN2(LOG_CRON);
PHPBN2(LOG_AUTHPRIV);
PHPBN2(LOG_LOCAL0);
PHPBN2(LOG_LOCAL1);
PHPBN2(LOG_LOCAL2);
PHPBN2(LOG_LOCAL3);
PHPBN2(LOG_LOCAL4);
PHPBN2(LOG_LOCAL5);
PHPBN2(LOG_LOCAL6);
PHPBN2(LOG_LOCAL7);
PHPBN2(LOG_PID);
PHPBN2(LOG_CONS);
PHPBN2(LOG_ODELAY);
PHPBN2(LOG_NDELAY);
PHPBN2(LOG_NOWAIT);
PHPBN2(LOG_PERROR);

PHPBN2(PREG_BACKTRACK_LIMIT_ERROR);
PHPBN2(PREG_BAD_UTF8_ERROR);
PHPBN2(PREG_INTERNAL_ERROR);
PHPBN2(PREG_NO_ERROR);
PHPBN2(PREG_RECURSION_LIMIT_ERROR);
PHPBN2(UPLOAD_ERR_EXTENSION);
PHPBN2(STREAM_SHUT_RD);
PHPBN2(STREAM_SHUT_WR);
PHPBN2(STREAM_SHUT_RDWR);
PHPBN2(CURLE_FILESIZE_EXCEEDED);
PHPBN2(CURLE_FTP_SSL_FAILED);
PHPBN2(CURLE_LDAP_INVALID_URL);
PHPBN2(CURLFTPAUTH_DEFAULT);
PHPBN2(CURLFTPAUTH_SSL);
PHPBN2(CURLFTPAUTH_TLS);
PHPBN2(CURLFTPSSL_ALL);
PHPBN2(CURLFTPSSL_CONTROL);
PHPBN2(CURLFTPSSL_NONE);
PHPBN2(CURLFTPSSL_TRY);
PHPBN2(CURLOPT_FTP_SSL);
PHPBN2(CURLOPT_FTPSSLAUTH);
PHPBN2(CURLOPT_TCP_NODELAY);
PHPBN2(CURLOPT_TIMEOUT_MS);
PHPBN2(CURLOPT_CONNECTTIMEOUT_MS);
PHPBN2(GMP_VERSION);
PHPBN2(OPENSSL_VERSION_NUMBER);
PHPBN2(SNMP_OID_OUTPUT_FULL);
PHPBN2(SNMP_OID_OUTPUT_NUMERIC);
PHPBN2(MSG_EAGAIN);
PHPBN2(MSG_ENOMSG);

PHPBN2(CURLOPT_PROGRESSFUNCTION);
PHPBN2(IMG_FILTER_PIXELATE);
PHPBN2(JSON_ERROR_CTRL_CHAR);
PHPBN2(JSON_ERROR_DEPTH);
PHPBN2(JSON_ERROR_NONE);
PHPBN2(JSON_ERROR_STATE_MISMATCH);
PHPBN2(JSON_ERROR_SYNTAX);
PHPBN2(JSON_FORCE_OBJECT);
PHPBN2(JSON_HEX_TAG);
PHPBN2(JSON_HEX_AMP);
PHPBN2(JSON_HEX_APOS);
PHPBN2(JSON_HEX_QUOT);
PHPBN2(LDAP_OPT_NETWORK_TIMEOUT);
PHPBN2(LIBXML_LOADED_VERSION);
PHPBN2(PREG_BAD_UTF8_OFFSET_ERROR);
PHPBN2(BUS_ADRALN);
PHPBN2(BUS_ADRERR);
PHPBN2(BUS_OBJERR);
PHPBN2(CLD_CONTIUNED);
PHPBN2(CLD_DUMPED);
PHPBN2(CLD_EXITED);
PHPBN2(CLD_KILLED);
PHPBN2(CLD_STOPPED);
PHPBN2(CLD_TRAPPED);
PHPBN2(FPE_FLTDIV);
PHPBN2(FPE_FLTINV);
PHPBN2(FPE_FLTOVF);
PHPBN2(FPE_FLTRES);
PHPBN2(FPE_FLTSUB);
PHPBN2(FPE_FLTUND);
PHPBN2(FPE_INTDIV);
PHPBN2(FPE_INTOVF);
PHPBN2(ILL_BADSTK);
PHPBN2(ILL_COPROC);
PHPBN2(ILL_ILLADR);
PHPBN2(ILL_ILLOPC);
PHPBN2(ILL_ILLOPN);
PHPBN2(ILL_ILLTRP);
PHPBN2(ILL_PRVOPC);
PHPBN2(ILL_PRVREG);
PHPBN2(POLL_ERR);
PHPBN2(POLL_HUP);
PHPBN2(POLL_IN);
PHPBN2(POLL_MSG);
PHPBN2(POLL_OUT);
PHPBN2(POLL_PRI);
PHPBN2(SEGV_ACCERR);
PHPBN2(SEGV_MAPERR);
PHPBN2(SI_ASYNCIO);
PHPBN2(SI_KERNEL);
PHPBN2(SI_MESGQ);
PHPBN2(SI_NOINFO);
PHPBN2(SI_QUEUE);
PHPBN2(SI_SIGIO);
PHPBN2(SI_TIMER);
PHPBN2(SI_TKILL);
PHPBN2(SI_USER);
PHPBN2(SIG_BLOCK);
PHPBN2(SIG_SETMASK);
PHPBN2(SIG_UNBLOCK);
PHPBN2(TRAP_BRKPT);
PHPBN2(TRAP_TRACE);

PHPBN2(ENT_DISALLOWED);
PHPBN2(ENT_HTML401);
PHPBN2(ENT_HTML5);
PHPBN2(ENT_SUBSTITUTE);
PHPBN2(ENT_XML1);
PHPBN2(ENT_XHTML);
PHPBN2(IPPROTO_IP);
PHPBN2(IPPROTO_IPV6);
PHPBN2(IPV6_MULTICAST_HOPS);
PHPBN2(IPV6_MULTICAST_IF);
PHPBN2(IPV6_MULTICAST_LOOP);
PHPBN2(IP_MULTICAST_IF);
PHPBN2(IP_MULTICAST_LOOP);
PHPBN2(IP_MULTICAST_TTL);
PHPBN2(MCAST_JOIN_GROUP);
PHPBN2(MCAST_LEAVE_GROUP);
PHPBN2(MCAST_BLOCK_SOURCE);
PHPBN2(MCAST_UNBLOCK_SOURCE);
PHPBN2(MCAST_JOIN_SOURCE_GROUP);
PHPBN2(MCAST_LEAVE_SOURCE_GROUP);
PHPBN2(CURLOPT_MAX_RECV_SPEED_LARGE);
PHPBN2(CURLOPT_MAX_SEND_SPEED_LARGE);
PHPBN2(LIBXML_HTML_NODEFDTD);
PHPBN2(LIBXML_HTML_NOIMPLIED);
PHPBN2(LIBXML_PEDANTIC);
PHPBN2(OPENSSL_CIPHER_AES_128_CBC);
PHPBN2(OPENSSL_CIPHER_AES_192_CBC);
PHPBN2(OPENSSL_CIPHER_AES_256_CBC);
PHPBN2(OPENSSL_RAW_DATA);
PHPBN2(OPENSSL_ZERO_PADDING);
PHPBN2(PHP_OUTPUT_HANDLER_CLEAN);
PHPBN2(PHP_OUTPUT_HANDLER_CLEANABLE);
PHPBN2(PHP_OUTPUT_HANDLER_DISABLED);
PHPBN2(PHP_OUTPUT_HANDLER_FINAL);
PHPBN2(PHP_OUTPUT_HANDLER_FLUSH);
PHPBN2(PHP_OUTPUT_HANDLER_FLUSHABLE);
PHPBN2(PHP_OUTPUT_HANDLER_REMOVABLE);
PHPBN2(PHP_OUTPUT_HANDLER_STARTED);
PHPBN2(PHP_OUTPUT_HANDLER_STDFLAGS);
PHPBN2(PHP_OUTPUT_HANDLER_WRITE);
PHPBN2(PHP_SESSION_ACTIVE);
PHPBN2(PHP_SESSION_DISABLED);
PHPBN2(PHP_SESSION_NONE);
PHPBN2(STREAM_META_ACCESS);
PHPBN2(STREAM_META_GROUP);
PHPBN2(STREAM_META_GROUP_NAME);
PHPBN2(STREAM_META_OWNER);
PHPBN2(STREAM_META_OWNER_NAME);
PHPBN2(STREAM_META_TOUCH);
PHPBN2(ZLIB_ENCODING_DEFLATE);
PHPBN2(ZLIB_ENCODING_GZIP);
PHPBN2(ZLIB_ENCODING_RAW);
PHPBN2(U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR);
PHPBN2(IDNA_CHECK_BIDI);
PHPBN2(IDNA_CHECK_CONTEXTJ);
PHPBN2(IDNA_NONTRANSITIONAL_TO_ASCII);
PHPBN2(IDNA_NONTRANSITIONAL_TO_UNICODE);
PHPBN2(INTL_IDNA_VARIANT_2003);
PHPBN2(INTL_IDNA_VARIANT_UTS46);
PHPBN2(IDNA_ERROR_EMPTY_LABEL);
PHPBN2(IDNA_ERROR_LABEL_TOO_LONG);
PHPBN2(IDNA_ERROR_DOMAIN_NAME_TOO_LONG);
PHPBN2(IDNA_ERROR_LEADING_HYPHEN);
PHPBN2(IDNA_ERROR_TRAILING_HYPHEN);
PHPBN2(IDNA_ERROR_HYPHEN_3_4);
PHPBN2(IDNA_ERROR_LEADING_COMBINING_MARK);
PHPBN2(IDNA_ERROR_DISALLOWED);
PHPBN2(IDNA_ERROR_PUNYCODE);
PHPBN2(IDNA_ERROR_LABEL_HAS_DOT);
PHPBN2(IDNA_ERROR_INVALID_ACE_LABEL);
PHPBN2(IDNA_ERROR_BIDI);
PHPBN2(IDNA_ERROR_CONTEXTJ);
PHPBN2(JSON_PRETTY_PRINT);
PHPBN2(JSON_UNESCAPED_SLASHES);
PHPBN2(JSON_NUMERIC_CHECK);
PHPBN2(JSON_UNESCAPED_UNICODE);
PHPBN2(JSON_BIGINT_AS_STRING);

PHPBN2(IMG_AFFINE_TRANSLATE);
PHPBN2(IMG_AFFINE_SCALE);
PHPBN2(IMG_AFFINE_ROTATE);
PHPBN2(IMG_AFFINE_SHEAR_HORIZONTAL);
PHPBN2(IMG_AFFINE_SHEAR_VERTICAL);
PHPBN2(IMG_CROP_DEFAULT);
PHPBN2(IMG_CROP_TRANSPARENT);
PHPBN2(IMG_CROP_BLACK);
PHPBN2(IMG_CROP_WHITE);
PHPBN2(IMG_CROP_SIDES);
PHPBN2(IMG_FLIP_BOTH);
PHPBN2(IMG_FLIP_HORIZONTAL);
PHPBN2(IMG_FLIP_VERTICAL);
PHPBN2(IMG_BELL);
PHPBN2(IMG_BESSEL);
PHPBN2(IMG_BICUBIC);
PHPBN2(IMG_BICUBIC_FIXED);
PHPBN2(IMG_BLACKMAN);
PHPBN2(IMG_BOX);
PHPBN2(IMG_BSPLINE);
PHPBN2(IMG_CATMULLROM);
PHPBN2(IMG_GAUSSIAN);
PHPBN2(IMG_GENERALIZED_CUBIC);
PHPBN2(IMG_HERMITE);
PHPBN2(IMG_HAMMING);
PHPBN2(IMG_HANNING);
PHPBN2(IMG_MITCHELL);
PHPBN2(IMG_POWER);
PHPBN2(IMG_QUADRATIC);
PHPBN2(IMG_SINC);
PHPBN2(IMG_NEAREST_NEIGHBOUR);
PHPBN2(IMG_WEIGHTED4);
PHPBN2(IMG_TRIANGLE);
PHPBN2(JSON_ERROR_RECURSION);
PHPBN2(JSON_ERROR_INF_OR_NAN);
PHPBN2(JSON_ERROR_UNSUPPORTED_TYPE);
PHPBN2(MYSQLI_SERVER_PUBLIC_KEY);

PHPBN2(LDAP_ESCAPE_DN);
PHPBN2(LDAP_ESCAPE_FILTER);
PHPBN2(OPENSSL_DEFAULT_STREAM_CIPHERS);
PHPBN2(STREAM_CRYPTO_METHOD_ANY_CLIENT);
PHPBN2(STREAM_CRYPTO_METHOD_ANY_SERVER);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_0_CLIENT);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_0_SERVER);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_1_CLIENT);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_1_SERVER);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_2_CLIENT);
PHPBN2(STREAM_CRYPTO_METHOD_TLSv1_2_SERVER);
PHPBN2(PGSQL_CONNECT_ASYNC);
PHPBN2(PGSQL_CONNECTION_AUTH_OK);
PHPBN2(PGSQL_CONNECTION_AWAITING_RESPONSE);
PHPBN2(PGSQL_CONNECTION_MADE);
PHPBN2(PGSQL_CONNECTION_SETENV);
PHPBN2(PGSQL_CONNECTION_SSL_STARTUP);
PHPBN2(PGSQL_CONNECTION_STARTED);
PHPBN2(PGSQL_DML_ESCAPE);
PHPBN2(PGSQL_POLLING_ACTIVE);
PHPBN2(PGSQL_POLLING_FAILED);
PHPBN2(PGSQL_POLLING_OK);
PHPBN2(PGSQL_POLLING_READING);
PHPBN2(PGSQL_POLLING_WRITING);

/* Class names reserved by PHP. */
/* Check is case insensitive - these *MUST* be listed in lower case here. */
PHPCN(directory);
PHPCN(stdclass);
PHPCN(__php_incomplete_class);
PHPCN(exception);
PHPCN(errorexception);
PHPCN(php_user_filter);
PHPCN(closure);
PHPCN(generator);
PHPCN(self);
PHPCN(parent);
/* http://php.net/manual/en/migration70.incompatible.php#migration70.incompatible.other.classes */
PHPCN(bool); // As of PHP 7.0
PHPCN(int); // As of PHP 7.0
PHPCN(float); // As of PHP 7.0
PHPCN(string); // As of PHP 7.0
PHPCN(null); // As of PHP 7.0
PHPCN(true); // As of PHP 7.0
PHPCN(false); // As of PHP 7.0
PHPCN(resource); // As of PHP 7.0 (currently works but reserved)
PHPCN(object); // As of PHP 7.0 (currently works but reserved)
PHPCN(mixed); // As of PHP 7.0 (currently works but reserved)
PHPCN(numeric); // As of PHP 7.0 (currently works but reserved)
/* http://php.net/manual/en/migration71.incompatible.php#migration71.incompatible.invalid-class-names */
PHPCN(iterable); // As of PHP 7.1
PHPCN(void); // As of PHP 7.1
/* Predefined interfaces and classes, introduced in PHP 7.0.0 */
PHPCN(arithmeticerror);
PHPCN(assertionerror);
PHPCN(divisionbyzeroerror);
PHPCN(error);
PHPCN(throwable);
PHPCN(parseerror);
PHPCN(typeerror);
/* From extensions (which of these are actually predefined depends which
 * extensions are loaded by default). */
PHPCN(xmlwriter);
PHPCN(libxmlerror);
PHPCN(simplexmlelement);
PHPCN(soapclient);
PHPCN(soapvar);
PHPCN(soapserver);
PHPCN(soapfault);
PHPCN(soapparam);
PHPCN(soapheader);
PHPCN(recursiveiteratoriterator);
PHPCN(filteriterator);
PHPCN(recursivefilteriterator);
PHPCN(parentiterator);
PHPCN(limititerator);
PHPCN(cachingiterator);
PHPCN(recursivecachingiterator);
PHPCN(iteratoriterator);
PHPCN(norewinditerator);
PHPCN(appenditerator);
PHPCN(infiniteiterator);
PHPCN(emptyiterator);
PHPCN(arrayobject);
PHPCN(arrayiterator);
PHPCN(recursivearrayiterator);
PHPCN(splfileinfo);
PHPCN(directoryiterator);
PHPCN(recursivedirectoryiterator);
PHPCN(splfileobject);
PHPCN(spltempfileobject);
PHPCN(simplexmliterator);
PHPCN(logicexception);
PHPCN(badfunctioncallexception);
PHPCN(badmethodcallexception);
PHPCN(domainexception);
PHPCN(invalidargumentexception);
PHPCN(lengthexception);
PHPCN(outofrangeexception);
PHPCN(runtimeexception);
PHPCN(outofboundsexception);
PHPCN(overflowexception);
PHPCN(rangeexception);
PHPCN(underflowexception);
PHPCN(unexpectedvalueexception);
PHPCN(splobjectstorage);
PHPCN(reflectionexception);
PHPCN(reflection);
PHPCN(reflectionfunction);
PHPCN(reflectionparameter);
PHPCN(reflectionmethod);
PHPCN(reflectionclass);
PHPCN(reflectionobject);
PHPCN(reflectionproperty);
PHPCN(reflectionextension);
PHPCN(domexception);
PHPCN(domstringlist);
PHPCN(domnamelist);
PHPCN(domimplementationlist);
PHPCN(domimplementationsource);
PHPCN(domimplementation);
PHPCN(domnode);
PHPCN(domnamespacenode);
PHPCN(domdocumentfragment);
PHPCN(domdocument);
PHPCN(domnodelist);
PHPCN(domnamednodemap);
PHPCN(domcharacterdata);
PHPCN(domattr);
PHPCN(domelement);
PHPCN(domtext);
PHPCN(domcomment);
PHPCN(domtypeinfo);
PHPCN(domuserdatahandler);
PHPCN(domdomerror);
PHPCN(domerrorhandler);
PHPCN(domlocator);
PHPCN(domconfiguration);
PHPCN(domcdatasection);
PHPCN(domdocumenttype);
PHPCN(domnotation);
PHPCN(domentity);
PHPCN(domentityreference);
PHPCN(domprocessinginstruction);
PHPCN(domstringextend);
PHPCN(domxpath);
PHPCN(xmlreader);
PHPCN(sqlitedatabase);
PHPCN(sqliteresult);
PHPCN(sqliteunbuffered);
PHPCN(sqliteexception);
PHPCN(datetime);

/* Built-in PHP functions (incomplete). */
/* Includes Array Functions - http://php.net/manual/en/ref.array.php */
/* Check is case insensitive - these *MUST* be listed in lower case here */
PHPFN(__halt_compiler);
PHPFN(acos);
PHPFN(array);
PHPFN(array_change_key_case);
PHPFN(array_chunk);
PHPFN(array_column);
PHPFN(array_combine);
PHPFN(array_count_values);
PHPFN(array_diff);
PHPFN(array_diff_assoc);
PHPFN(array_diff_key);
PHPFN(array_diff_uassoc);
PHPFN(array_diff_ukey);
PHPFN(array_fill);
PHPFN(array_fill_keys);
PHPFN(array_filter);
PHPFN(array_flip);
PHPFN(array_intersect);
PHPFN(array_intersect_assoc);
PHPFN(array_intersect_key);
PHPFN(array_intersect_uassoc);
PHPFN(array_intersect_ukey);
PHPFN(array_key_exists);
PHPFN(array_keys);
PHPFN(array_map);
PHPFN(array_merge);
PHPFN(array_merge_recursive);
PHPFN(array_multisort);
PHPFN(array_pad);
PHPFN(array_pop);
PHPFN(array_product);
PHPFN(array_push);
PHPFN(array_rand);
PHPFN(array_reduce);
PHPFN(array_replace);
PHPFN(array_replace_recursive);
PHPFN(array_reverse);
PHPFN(array_search);
PHPFN(array_shift);
PHPFN(array_slice);
PHPFN(array_splice);
PHPFN(array_sum);
PHPFN(array_udiff);
PHPFN(array_udiff_assoc);
PHPFN(array_udiff_uassoc);
PHPFN(array_uintersect);
PHPFN(array_uintersect_assoc);
PHPFN(array_uintersect_uassoc);
PHPFN(array_unique);
PHPFN(array_unshift);
PHPFN(array_values);
PHPFN(array_walk);
PHPFN(array_walk_recursive);
PHPFN(arsort);
PHPFN(asin);
PHPFN(asort);
PHPFN(atan);
PHPFN(atan2);
PHPFN(ceil);
PHPFN(compact);
PHPFN(cos);
PHPFN(cosh);
PHPFN(count);
PHPFN(current);
PHPFN(die); // "Language construct"
PHPFN(each);
PHPFN(echo); // "Language construct"
PHPFN(empty);
PHPFN(end);
PHPFN(eval); // "Language construct"
PHPFN(exit); // "Language construct"
PHPFN(exp);
PHPFN(extract);
PHPFN(floor);
PHPFN(fmod);
PHPFN(in_array);
PHPFN(include); // "Language construct"
PHPFN(include_once); // "Language construct"
PHPFN(isset); // "Language construct"
PHPFN(key);
PHPFN(key_exists);
PHPFN(krsort);
PHPFN(ksort);
PHPFN(list); // "Language construct"
PHPFN(log);
PHPFN(log10);
PHPFN(max);
PHPFN(min);
PHPFN(natcasesort);
PHPFN(natsort);
PHPFN(next);
PHPFN(pos);
PHPFN(pow);
PHPFN(prev);
PHPFN(print); // "Language construct"
PHPFN(range);
PHPFN(reset);
PHPFN(rsort);
PHPFN(require); // "Language construct"
PHPFN(require_once); // "Language construct"
PHPFN(return); // "Language construct"
PHPFN(shuffle);
PHPFN(sin);
PHPFN(sinh);
PHPFN(sizeof);
PHPFN(sort);
PHPFN(sqrt);
PHPFN(tan);
PHPFN(tanh);
PHPFN(uasort);
PHPFN(uksort);
PHPFN(unset); // "Language construct"
PHPFN(usort);

#undef PHPKW
#undef PHPKW_ok_as_function
#undef PHPBN1a
#undef PHPBN1b
#undef PHPBN1
#undef PHPBN2a
#undef PHPBN2b
#undef PHPBN2
#undef PHPCN
#undef PHPFN
