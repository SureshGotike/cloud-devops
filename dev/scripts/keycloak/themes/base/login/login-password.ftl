<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayWide=false; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
	<label for="photo" class="${properties.kcLabelClass!}" style="display: block; text-align: center;"> <image src="${photo}" width="50px" height="50px" style=" border-radius: 50%;"> </label>
    <div id="kc-form">
      <div id="kc-form-wrapper">
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                <div class="${properties.kcFormGroupClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                  </div>
            </form>
        </div>
      </div>
    </#if>

</@layout.registrationLayout>
