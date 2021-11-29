<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayRequiredFields=true; section>

    <#if section = "header">
        ${msg("loginTotpTitle")}

    <#elseif section = "form">

    <ol id="kc-totp-settings">
        <li>
            <p>${msg("loginTotpStep1")}</p>

            <ul id="kc-totp-supported-apps">
	    <li>

				
				<#if realm.displayName=="mts">
					${msg("loginTotpStep1Apps",'MeID')?cap_first}
				<#elseif  realm.displayName=="unifyia">
                                        ${msg("loginTotpStep1Apps",'EpicIdentity')?cap_first}
                                <#elseif  realm.displayName=="preview">
                                        ${msg("loginTotpStep1Apps",'EpicIdentity')?cap_first}
				<#elseif  realm.displayName=="incadence">
                                        ${msg("loginTotpStep1Apps",'EpicIdentity')?cap_first}
                                <#else>

					${msg("loginTotpStep1Apps",realm.displayName)?cap_first}
				</#if>
				

<a href="https://play.google.com/store/apps/details?id=com.epicidetity.mobileid&hl=en_IN" target="_blank"><image width="100" height="30" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIcAAAAoCAYAAADUrekxAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QkQwRDhBOUM0MDdDMTFFN0FEQThBNjg5MEQ3N0I1MEMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QkQwRDhBOUI0MDdDMTFFN0FEQThBNjg5MEQ3N0I1MEMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NDcxRDY3MUIyQzk3MTFFNkEyQjg5N0IxMjdFN0FDMDAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NDcxRDY3MUMyQzk3MTFFNkEyQjg5N0IxMjdFN0FDMDAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz48VlG6AAAPOElEQVR42uxc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"></a><a href="https://apps.apple.com/in/app/epicIdentityMobileID/id123456789" target="_blank"><image width="100" height="30" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIcAAAAoCAYAAADUrekxAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjY3REM1MTAyMkM5NzExRTY5NUVEOERFNjk5MEVBNDE2IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjY3REM1MTAzMkM5NzExRTY5NUVEOERFNjk5MEVBNDE2Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NjdEQzUxMDAyQzk3MTFFNjk1RUQ4REU2OTkwRUE0MTYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NjdEQzUxMDEyQzk3MTFFNjk1RUQ4REU2OTkwRUE0MTYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4YGv+iAAAM2UlEQVR42uycCbCN5R/Hn3u5lS3JmiUkZG91UVwpWUP2JZWypEF2baYYo8kot+Z/i4vJVk2RJWMZ105oG1tCSEOyhLIW0vP/fX7T8857zj33zr3n3HuJ851557zneZ/3WX/Pbz8nxgg+/vjjOPkYdPny5Z6nTp2qKJ8miusLuXLlsoUKFdoZExOTLF//17Vr18sx/xLGwpSUlCaff/65OX36dHSlrlPceuutplOnTqZ+/foL5Gu73HCMZcuWNZk2bVp0da5znDx50nzwwQcmd+7crevWrTswFlEyd+7c6MpE4WH27Nl89IpFx4iKkij8OHLkiLlw4UKl2KjyGUUoCF3ExOZER7GxsaZLly4G8XX//feH3c4NN9xgSpcubWrVqmWKFy+erWN+4403zC233BJRG88//7wpV65cto2xTZs2pk6dOtm3CO+++66Vj2y7ihYtar/88kvr8MADD4Td1jPPPGP/+OMPu3z5crt//3779ddf2zvvvDNbxg1kYyNqY8uWLbZhw4ZZNqabb77ZCkF438WIsAMHDsyW+U+ZMsVmK+eIi4szixcvNvXq1dPvsrFm69atEbUpC24effRRc8cdd5hvv/3WTJ8+3XtWuXJl8+yzz5qEhASP03C6brzxRpMvXz7z2GOPaXmpUqVMgwYN9L5FixambNmy+h5thkKBAgWU82Hm5c2b1/kFTOPGjc3TTz+t/TrQD/WaNGmS5hxkk7328uTJo2VFihRRLvDggw+aJ5980uvHj759+5oJEybomB2YW+fOnb05g5iYGO2/R48e2m7YHD87ieO5554LECPCpczFixezpG052Gp2QXgspJxQs3r1alOmTBmTnJxsRowYoX0lJiYa4VamefPmZsmSJaZw4cKmd+/epm3bttrORx99ZD755BMluO+++87kz58/oB8275tvvjGNGjUy7du3N+vXr8fUMyVKlNBNuv32282mTZtMsWLFdFOEqxnhcKZr166mevXqqcZN+xA1m9mxY0ezbt06JTTqpqSkmMGDB5sBAwaYUK4F6vD+Qw89FEAwENSiRYt0DmD06NGmf//+pnz58mbDhg063qtOrKxZs8YTJytXrrRC5RG1h1gRAvC+33XXXdq2nFYrm2xFT9DyJ554wu7bt0/vk5KS7Msvv6wsmHe7detmZYM9do+YksXV++PHj9v4+PgAsdKyZUu7e/duLRNOZMW6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"></a></li>
            
	    </ul>
        </li>

        <#if mode?? && mode = "manual">
            <li>
                <p>${msg("loginTotpManualStep2")}</p>
                <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
            </li>
            <li>
                <p>${msg("loginTotpManualStep3")}</p>
                <p>
                    <ul>
                        <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                        <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                        <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                        <#if totp.policy.type = "totp">
                            <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                        </#if>
                    </ul>
                </p>
            </li>
        <#else>
            <li>
                <p>${msg("loginTotpStep2")}</p>
                <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                <p><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
            </li>
        </#if>
        <li>
            <p>${msg("loginTotpStep3")}</p>
            <p>${msg("loginTotpStep3DeviceName")}</p>
        </li>
    </ol>

    <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
        <div class="${properties.kcFormGroupClass!}">
            <div class="${properties.kcInputWrapperClass!}">
                <label for="totp" class="control-label">${msg("authenticatorCode")}</label> <span class="required">*</span>
            </div>
            <div class="${properties.kcInputWrapperClass!}">
                <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}" />
            </div>
            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
            <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>
        </div>

        <div class="${properties.kcFormGroupClass!}" ${messagesPerField.printIfExists('userLabel',properties.kcFormGroupErrorClass!)}">
            <div class="${properties.kcInputWrapperClass!}">
                <label for="userLabel" class="control-label">${msg("loginTotpDeviceName")}</label> <#if totp.otpCredentials?size gte 1><span class="required">*</span></#if>
            </div>

            <div class="${properties.kcInputWrapperClass!}">
                <input type="text" class="form-control" id="userLabel" name="userLabel" autocomplete="off">
            </div>
        </div>

        <#if isAppInitiatedAction??>
            <input type="submit"
                   class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                   id="saveTOTPBtn" value="${msg("doSubmit")}"
            />
            <button type="submit"
                    class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonLargeClass!}"
                    id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
            </button>
        <#else>
            <input type="submit"
                   class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                   id="saveTOTPBtn" value="${msg("doSubmit")}"
            />
        </#if>
    </form>
    </#if>
</@layout.registrationLayout>
