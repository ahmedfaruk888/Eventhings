<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="codelink.aspx.cs" Inherits="Eventhings.admin.codelink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function redirectbyRole() {

            var user = JSON.parse(sessionStorage.getItem('user'));

            if (user == null || user == undefined || user.role_name == undefined || user.role_name == null) {

                var currentPathName = window.location.pathname;

                alert('Your account type can not be determined, contact administrator');

                //window.location.replace("../login.html");
                return;
            } else {

                var codeText = new URLSearchParams(window.location.search).get('code');
                var roleName = user.role_name;

                if (roleName == 'vendor') {

                    /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
                    window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
                    return;
                }

                if (roleName == 'administrator') {

                    /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
                    window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
                    return;
                }

                if (roleName == 'customer') {

                    /*window.location.replace("../clients/auth/vendor-sales.aspx?code=" + codeText);*/
                    window.location.replace("../auth/vendor-sales.aspx?code=" + codeText);
                    return;
                }

            }
        }
    </script>
    <script src="../clients/assets/vendors/jquery/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {

            var searchParam = window.location.search;

            if (searchParam) {

                var searchCodeval = window.location.search.split('=')[1];

                if (searchCodeval == undefined) {
                    return;
                }

                window.location.replace("../clients/auth/codelink.aspx?code=" + searchCodeval);

            }

        });
    </script>
</body>
</html>
