<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.name)}
    <#elseif section = "header">
        ${msg("loginTitleHtml",realm.name)}
    <#elseif section = "form">
	<label for="photo" class="${properties.kcLabelClass!}" style="display: block; text-align: center;"> <image src="${photo}" width="50px" height="50px" style=" border-radius: 50%;"> </label>
        <form id="kc-push-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
			<div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="push" class="${properties.kcLabelClass!}" style="display: block; text-align: center;"> Use MeetIdentity Wallet to approve Login Request</label>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                      <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}  ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" style="margin-left:auto;margin-right:auto;display:block"
                              name="tryagain" type="submit" value="${msg("doClickAfterApproval")}" onClick="checkForApproval()"/>
								<input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
									   name="cancel" id="kc-cancel" type="submit" value="${msg("doOtherwaysToLogIn")}"/>
                    </div>
                </div>
            </div>
        </form>


                            <script>
                                        var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
                                        //alert(isMobile);
                                        var interval = 5;
                                        if(isMobile){


                                        }else {
                                                // alert(isMobile);
                                                 var ele = document.getElementsByName("tryagain")[0];
                                                // alert(ele.style.display);
                            
 ele.style.display = "none";
window.addEventListener('DOMContentLoaded', (event) => {
       window.setTimeout(function () {
         document.forms["kc-push-login-form"].submit();
       }, parseInt(interval) * 1000);
 });


				            }
                            </script>

    </#if>
</@layout.registrationLayout>
