// HTML, APIs, DOM {

user_pref("dom.battery.enabled", false);
user_pref("dom.push.enabled", false);
user_pref("geo.enabled", false);
user_pref("webgl.disabled", true);
user_pref("beacon.enabled", false);
user_pref("media.navigator.enabled", false);
user_pref("dom.telephony.enabled", false);
user_pref("dom.enable_performance", false);
user_pref("media.webspeech.recognition.enable", false);
user_pref("media.getusermedia.screensharing.enabled", false);
user_pref("device.sensors.enabled", false);
user_pref("dom.gamepad.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.webnotifications.enabled", false);

// Turn off pinging <a> links
user_pref("browser.send_pings", false);

// Information about network/browser connection
user_pref("dom.netinfo.enabled", false);

// Don't use WebRTC
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.turn.disable", true);
user_pref("media.peerconnection.use_document_iceservers", false);
user_pref("media.peerconnection.video.enabled", false);
user_pref("media.peerconnection.identity.timeout", 1);

// }


// Browser settings & features {

// Disable Pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);

// Disable Google safebrowsing
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Disable new tab ads and preloading
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtabpage.introShown", true);

// Disable heartbeat
user_pref("browser.selfsupport.url", "");

// Disable auto-update
user_pref("app.update.auto", false);

// Disable Firefox Hello
user_pref("loop.enabled", false);
user_pref("loop.logDomains", false);

// Enable Firefox built-in tracking protection
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.donottrackheader.value", 1);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// Resist fingerprinting
user_pref("privacy.resistFingerprinting", true);

// Disable PDF viewer
user_pref("pdfjs.disabled", true);

// Telemetry
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Disable WebIDE
user_pref("devtools.webide.enabled", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);

// }


// Network {

// Disable page prefetching
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Disable search suggestions
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

// Spoof referer header
user_pref("network.http.referer.spoofSource", true);
user_pref("network.http.sendSecureXSiteReferrer", false);

// Disallow NTLMv1 for HTTP
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1", false);

// Content Security Policy
user_pref("security.csp.experimentalEnabled", true);
user_pref("security.csp.enable", true);

// Block third-party cookies
user_pref("network.cookie.cookieBehavior", 1);
// Accept cookies for current session only
user_pref("network.cookie.lifetimePolicy", 2);
// Third-party cookies for current session only (if enabled at all)
user_pref("network.cookie.thirdparty.sessionOnly", true);

// HTTP Strict Transport Security
user_pref("network.stricttransportsecurity.preloadlist", true);

// Online Certificate Status Protocol
user_pref("security.ssl.enable_ocsp_stapling", true);

user_pref("security.ssl.disable_session_identifiers", true);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl.errorReporting.automatic", false);

// }


// Crypto {

// Disable null ciphers
user_pref("security.ssl3.rsa_null_sha", false);
user_pref("security.ssl3.rsa_null_md5", false);
user_pref("security.ssl3.ecdhe_rsa_null_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_null_sha", false);
user_pref("security.ssl3.ecdh_rsa_null_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_null_sha", false);

// }


// Misc {

user_pref("camera.control.face_detection.enabled", false);
user_pref("camera.control.autofocus_moving_callback.enabled", false);

// Don't monitor connection status
user_pref("network.manage-offline-status", false);

// Disable fixing URLs, e.g. adding www at the beginning
user_pref("browser.fixup.alternate.enabled", false);

// Mixed content
user_pref("security.mixed_content.block_active_content", true);
user_pref("security.mixed_content.block_display_content", true);

// Disable asm.js
user_pref("javascript.options.asmjs", false);

// Prevent font fingerprinting
user_pref("browser.display.use_document_fonts", 0);

// }

