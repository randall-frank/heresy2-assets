document.addEventListener('DOMContentLoaded', () => {
    const cookieConsentBanner = document.getElementById('cookie-consent-banner');
    const acceptCookiesButton = document.getElementById('accept-cookies');
    const rejectCookiesButton = document.getElementById('reject-cookies');
    const consentCookieName = 'heresy_consent_accepted';

    // Check if consent has already been given
    if (getCookie(consentCookieName) !== 'true') {
        cookieConsentBanner.style.display = 'block'; // Show the banner
    } else {
        cookieConsentBanner.style.display = 'none'; // Hide the banner if consent is already given
        heresy_allow_cookies = true; // Allow cookies in the application
    }

    // Event listener for accepting cookies
    acceptCookiesButton.addEventListener('click', () => {
        setCookie(consentCookieName, 'true', 30); // Set cookie for 30 days
        cookieConsentBanner.style.display = 'none'; // Hide the banner
        heresy_allow_cookies = true; // Allow cookies in the application
    });
    rejectCookiesButton.addEventListener('click', () => {
        cookieConsentBanner.style.display = 'none'; // Hide the banner
        heresy_allow_cookies = false; // Do not allow cookies in the application
    });
});
