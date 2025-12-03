<#import "template.ftl" as layout>
<#import "messages.ftl" as messages>

<@layout.accountLayout active="account">

    <h1>${msg("accountManagementTitle")}</h1>

    <p>${msg("accountManagementWelcomeMessage")}</p>
    
    <#-- Add content specific to the account index page here -->

</@layout.accountLayout>
