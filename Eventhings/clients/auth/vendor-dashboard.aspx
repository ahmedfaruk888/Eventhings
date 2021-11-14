<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="vendor-dashboard.aspx.cs" Inherits="Eventhings.clients.auth.vendor_dashboard" %>

<asp:Content ID="headConteContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var user = JSON.parse(sessionStorage.getItem('user'));
        if (user.role_name !== 'vendor') {

            var currentPathName = window.location.href;
            window.location.replace("../login.html?redirect=" + currentPathName);
        } 
    </script>
    <title>Vendor - Dashboard</title>
</asp:Content>

<asp:Content ID="menuContent" ContentPlaceHolderID="menuContentplaceHolder" runat="server">
    <header class="foi-header" style="padding-top: 2px">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light foi-navbar" style="margin-top: 2px">
                <a class="navbar-brand" href="index.html">
                    <img src="../assets/images/logo.png" alt="FOI">
                </a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="vendor-dashboard.aspx"> Dashboard |<span class="sr-only">(current)</span></a>
                        </li>
                        <%--<li class="nav-item">
                            <a class="nav-link" href="qrcode.aspx">Transaction History|</a>
                        </li>--%>
                        <%--<li class="nav-item">
                            <a class="nav-link" href="vendor-sales.aspx">Service |</a>
                        </li>--%>
                    </ul>
                    <ul class="navbar-nav mt-2 mt-lg-0">
                        <li class="nav-item">
                            <%--<a class="btn btn-light" href="../login.html">Logout</a>--%>
                            <a class="btn btn-light" id="btnLogout" onclick="LogOut()" href="../login.html">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <section class="auth-wrapper">
                        <!--style="padding-top:10px"-->
                        <div class="row">
                            <div class="col-md-12 mb-4 mb-md-0">
                                <h2 class="auth-section-title welcome-text"></h2>
                                <p class="">Your account has been created successfuly, a confirmation mail has been sent to the provided email.</p>

                                <form action="registration-success.html" method="POST" id="frmRegistrationSuccess">
                                    <div class="alert alert-info alert-dismissible" id="divAlert">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <p id="lblErrorText">
                                            <strong>Error!</strong> Indicates a successful or positive action.
                                        </p>
                                    </div>

                                    <table class="table">
                                        <%--<caption> <span> Eventi Name Here </span> </caption>--%>
                                        <thead>
                                            <tr>
                                                <td class="font-weight-normal"></td>
                                                <td class="font-weight-normal">Account Status</td>
                                                <td class="font-weight-normal">Type</td>
                                                <td class="font-weight-normal">Product Name</td>
                                                <td class="font-weight-normal">Total Sales</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td> 1. </td>
                                                <td> Account - Active </td>
                                                <td> Vendor Account </td>
                                                <td> - </td>
                                                <td> - </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <button class="btn btn-primary btn-auth-submit" type="button" id="btnSerices">Go to Service</button>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            console.log('Jquery is ready to shoot');
            $('#divAlert').hide();
            //$('#btnSerices').hide();

            var user = sessionStorage.getItem('user');
            user = JSON.parse(user);

            $('.welcome-text').html('Welcome ' + user.full_name);

            $("#btnSerices").on('click', function () {

                window.location.replace("../auth/vendor-sales.aspx");

            });

            var data = {
                email: sessionStorage.getItem('email')
            }

            $.ajax({
                type: "POST",
                url: "/Services/sales.asmx/TotalSalesByVendor",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    $('tbody tr td').eq(4).text(responseData.Message);
                }
            });
        });

    </script>
</asp:Content>
