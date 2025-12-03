<#macro accountLayout displayRequiredFields=false displayMessage=true active="account" bodyClass="" headerElement="header">
<!DOCTYPE html>
<html<#if locale.currentLanguageTag??> lang="${locale.currentLanguageTag}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("accountTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/mastiff-logo.png" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="pf-c-page ${bodyClass!}">

    <#-- Top Header/Navbar -->
    <header class="pf-c-page__header" role="banner">
        <div class="pf-c-page__header-brand">
            <a class="pf-c-page__header-brand-link" href="${url.accountUrl}">
                <img class="kc-header-logo" src="${url.resourcesPath}/img/logo.png" alt="${kcSanitize(msg("accountTitle"))?no_esc}" />
            </a>
        </div>
        <div class="pf-c-page__header-content">
            <div id="kc-logout">
                <a href="${url.logoutUrl}" class="pf-c-button pf-m-secondary" type="button">${msg("doLogout")}</a>
            </div>
            <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                <div id="kc-locale-dropdown" class="kc-locale-dropdown">
                    <button class="pf-c-button pf-m-plain" aria-label="${msg("languages")}" aria-haspopup="true" aria-expanded="false" aria-controls="language-switch">
                        <i class="fas fa-globe"></i> ${locale.current}
                    </button>
                    <ul id="language-switch" class="pf-c-dropdown__menu" hidden>
                        <#list locale.supported as l>
                            <li class="pf-c-dropdown__menu-item">
                                <a href="${l.url}">${l.label}</a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
    </header>

    <#-- Sidebar Navigation -->
    <div class="pf-c-page__sidebar" id="kc-sidebar">
        <div class="pf-c-page__sidebar-body">
            <nav class="pf-c-nav" aria-label="${msg("accountNavigation")}">
                <ul class="pf-c-nav__list">
                    <li class="pf-c-nav__item">
                        <a href="${url.accountUrl}" class="pf-c-nav__link <#if active == "account">pf-m-current</#if>">${msg("account")}</a>
                    </li>
                    <#if features.password>
                    <li class="pf-c-nav__item">
                        <a href="${url.passwordUrl}" class="pf-c-nav__link <#if active == "password">pf-m-current</#if>">${msg("password")}</a>
                    </li>
                    </#if>
                    <#if features.totp>
                    <li class="pf-c-nav__item">
                        <a href="${url.totpUrl}" class="pf-c-nav__link <#if active == "totp">pf-m-current</#if>">${msg("authenticator")}</a>
                    </li>
                    </#if>
                    <#if features.webauthn>
                    <li class="pf-c-nav__item">
                        <a href="${url.webauthnUrl}" class="pf-c-nav__link <#if active == "webauthn">pf-m-current</#if>">${msg("webauthn")}</a>
                    </li>
                    </#if>
                    <#if features.log>
                    <li class="pf-c-nav__item">
                        <a href="${url.logUrl}" class="pf-c-nav__link <#if active == "log">pf-m-current</#if>">${msg("log")}</a>
                    </li>
                    </#if>
                    <#if features.sessions>
                    <li class="pf-c-nav__item">
                        <a href="${url.sessionsUrl}" class="pf-c-nav__link <#if active == "sessions">pf-m-current</#if>">${msg("sessions")}</a>
                    </li>
                    </#if>
                    <#if features.applications>
                    <li class="pf-c-nav__item">
                        <a href="${url.applicationsUrl}" class="pf-c-nav__link <#if active == "applications">pf-m-current</#if>">${msg("applications")}</a>
                    </li>
                    </#if>
                    <#if realm.referrer??>
                    <li class="pf-c-nav__item">
                        <a href="${realm.referrer.url}" class="pf-c-nav__link">${msg("backTo", realm.referrer.htmlDisplayName)}</a>
                    </li>
                    </#if>
                </ul>
            </nav>
        </div>
    </div>

    <main class="pf-c-page__main" role="main">
        <section class="pf-c-page__main-section pf-m-dark-100 pf-u-py-2xl" <#if bodyClass?has_content>style="min-height: 100vh;"</#if>>
            <div class="pf-c-content">
                <#if displayMessage && message?has_content>
                    <div class="pf-c-alert pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if> pf-m-inline">
                        <div class="pf-c-alert__icon">
                            <#if message.type = 'success'><i class="fas fa-check-circle"></i></#if>
                            <#if message.type = 'warning'><i class="fas fa-exclamation-triangle"></i></#if>
                            <#if message.type = 'error'><i class="fas fa-exclamation-circle"></i></#if>
                            <#if message.type = 'info'><i class="fas fa-info-circle"></i></#if>
                        </div>
                        <h4 class="pf-c-alert__title">${kcSanitize(message.summary)?no_esc}</h4>
                    </div>
                </#if>
                <#nested "content">
            </div>
        </section>
        <footer class="pf-c-page__main-footer">
            <div class="pf-c-content">
                <p>Powered by Keycloak</p>
            </div>
        </footer>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dropdownButton = document.querySelector('#kc-locale-dropdown button');
            const dropdownMenu = document.querySelector('#kc-locale-dropdown ul');

            if (dropdownButton && dropdownMenu) {
                dropdownButton.addEventListener('click', function() {
                    const isExpanded = this.getAttribute('aria-expanded') === 'true' || false;
                    this.setAttribute('aria-expanded', !isExpanded);
                    dropdownMenu.hidden = isExpanded;
                });
            }
        });
    </script>
</body>
</html>
</#macro>