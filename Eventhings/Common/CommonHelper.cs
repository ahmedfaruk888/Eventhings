using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Common
{
    public static class CommonHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request.QueryString[ProviderNameKey];
        }

        public const string CodeKey = "code";
        public static string GetCodeFromRequest(HttpRequest request)
        {
            return request.QueryString[CodeKey];
        }

        public static string GetQueryValueFromRequest(HttpRequest request, string querystring)
        {
            return request.QueryString[querystring];
        }

        public const string UserIdKey = "userId";
        public static string GetUserIdFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[UserIdKey]);
        }

        public const string OtpKey = "otp";
        public static string GetOtpFromRequest(HttpRequest request)
        {
            return HttpUtility.UrlDecode(request.QueryString[OtpKey]);
        }

        public static string GetQrCodeValueRequest(HttpRequest request, string otpkey)
        {
            return HttpUtility.UrlDecode(request.QueryString[otpkey]);
        }

        public static string GetResetPasswordRedirectUrl(string code, string userId, HttpRequest request)
        {
            //var absoluteUri = "/account/reset-password-confirmation.aspx?" + CodeKey + "=" + HttpUtility.UrlEncode(code);
            var absoluteUri = "/account/reset-password-confirmation.aspx?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId);
            Uri url = (request.IsLocal || request.Url.Host.Equals("localhost")) ? new Uri("http://www.bbt.imaftechnet.com") : request.Url;
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
        {
            var absoluteUri = "/account/confirm-account.aspx?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId);
            Uri url = (request.IsLocal || request.Url.Host.Equals("localhost")) ? new Uri("http://www.bbt.imaftechnet.com") : request.Url;
            return new Uri(request.Url, absoluteUri).AbsoluteUri.ToString();
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/auth/dashboard.aspx");
            }
        }
    }
}