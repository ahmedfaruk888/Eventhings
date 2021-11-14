<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Eventhings.clients.auth.dashboard" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var user = JSON.parse(sessionStorage.getItem('user'));
        if (user.role_name !== 'administrator') {

            var currentPathName = window.location.href;
            window.location.replace("../login.html?redirect=" + currentPathName);
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <section class="auth-wrapper">
                    <!--style="padding-top:10px"-->
                    <div class="row">
                        <div class="col-md-12 mb-4 mb-md-0">
                            <p class="auth-section-title welcome-text"></p>
                            <%--<p class="">Your account has been created successfuly, a confirmation mail has been sent to the provided email.</p>--%>

                            <form action="registration-success.html" method="POST" id="frmRegistrationSuccess">
                                <div class="alert alert-info alert-dismissible" id="divAlert">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <p id="lblErrorText">
                                        <strong>Error!</strong> Indicates a successful or positive action.
                                    </p>
                                </div>

                                <p class="card-title mt-3 mb-3 h6">Account Information</p>
                                <table class="table table-hover mt-3">
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
                                            <td>1. </td>
                                            <td>Account - Active </td>
                                            <td>Administrator Account </td>
                                            <td>- </td>
                                            <td>- </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <p class="card-title mt-3 mb-3 h6">Sales Information</p>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group float-right">
                                            <select id="cmbVendors" name="cmbVendors" class="form-select form-select-md">
                                            </select>
                                        </div>
                                        <div class="form-group float-right">
                                            <select id="cmbEvents" name="cmbEvents" class="form-select form-select-md">
                                                <option>-choose event--</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div style="max-height: 300px; overflow-y: scroll">
                                    <table class="table table-hover mt-3" id="vendorSalesTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="mstrRoleChecked"/>
                                                    </div>
                                                </th>
                                                <th scope="col">S/N</th>
                                                <th scope="col">Vendor Name</th>
                                                <th scope="col">Last Tranx. Date</th>
                                                <th scope="col">Total Sales Amount</th>
                                                <th scope="col">ToTal Sales Point</th>
                                            </tr>
                                        </thead>
                                        <tbody id="vendorSalesTBody">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            console.log('Jquery is ready to shoot');

            $('#divAlert').hide();
            $.getVendors();
            $.getVendorSalesReport();

            var user = sessionStorage.getItem('user');
            user = JSON.parse(user);

            $('.welcome-text').html('Welcome ' + user.full_name);

            $("#btnSerices").on('click', function () {

                window.location.replace("../auth/vendor-sales.aspx");

            });

            $('#cmbVendors').on('change', function (e) {

                //if ($(this).val() == '0')
                //    return;

                $.getVendorSalesReport();

                e.preventDefault();
            });



            var data = {

                email: sessionStorage.getItem('email')
            }

            $.ajax({
                type: "POST",
                url: "/Services/sales.asmx/TotalSales",
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
