<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="vendor-sales.aspx.cs" Inherits="Eventhings.clients.auth.vendor_sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var user = JSON.parse(sessionStorage.getItem('user'));
        if (user.role_name !== 'vendor') {

            var currentPathName = window.location.href;
            window.location.replace("../login.html?redirect=" + currentPathName);
        }
    </script>
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
                            <a class="nav-link" href="vendor-dashboard.aspx">Dashboard |<span class="sr-only">(current)</span></a>
                        </li>
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

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
                <section class="auth-wrapper">
                    <!--style="padding-top:10px"-->
                    <div class="row">
                        <div class="col-md-12 mb-4 mb-md-0">
                            <div class="alert alert-info alert-dismissible" id="divAlert">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <p id="lblErrorText">
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Launch static backdrop modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Choose Products</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            I will not close if you click outside me. Don't even try to press escape key.
                        </p>
                        <div class="form-group col-md-12">
                            <label for="cmbCategoryParent">Choose a product</label>
                            <select required="required" class="form-control form-select multiple" id="cmbVendorItems" name="cmbVendorItems">
                                <option>--choose one--</option>
                                <option>--choose two--</option>
                                <option>--choose three--</option>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <input type="number" class="form-control form-control-lg" name="txtQuantity" id="txtQuantity" min="1" max="100" value="1" />
                        </div>
                        <div class="form-group col-md-12 align-content-md-end">
                            <input type="button" name="btnAdd" id="btnAdd" value="Add" class="btn btn-primary" />
                        </div>
                        <hr />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Make Sales &amp; Checkout</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="footerContent" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        function MakeSales(code, email) {

            var mappeddto = {
                code: code,
                email_address: email
            }

            var data = {
                mappeddto: mappeddto
            }

            $.ajax({
                type: "POST",
                url: "/Services/sales.asmx/MakeSales",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    if (responseData == null || responseData.undefined) {

                        $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").attr('display', false).slideDown("slow");
                        return;
                    }

                    //console.log(responseData);
                    $("#lblErrorText").html(responseData.Message);

                    console.log(responseData.event_name);

                    //if code is valid and mapped
                    if (responseData.Status == '1') {

                        var allowedPayment = responseData.allowed_payment;
                        switch (allowedPayment) {

                            case 1:
                                Swal.fire(
                                    'Success!',
                                    'The customer code is valid. transaction completed!  ' + '<p>' + code + '</p> Previous Point = ' + responseData.point + '<p>Current Point = ' + responseData.new_point + '</p>',
                                    'success'
                                )
                                break;
                            case 2:
                                Swal.fire(
                                    'Success!',
                                    'The customer code is valid. transaction completed!  ' + '<p>' + code + '</p>' + 'Previous Balance = ' + responseData.prev_balance + '' + '<p>Current Balance = ' + responseData.new_balance + '</p>',
                                    'success'
                                )
                                break;
                            case 3:
                                Swal.fire(
                                    'Success!',
                                    'The customer code is valid. transaction completed!  ' + '<p>' + code + '</p> Previous Point = ' + responseData.point + '<p>Current Point = ' + responseData.new_point + '</p>' + 'Previous Balance = ' + responseData.prev_balance + '' + '<p>Current Balance = ' + responseData.new_balance + '</p>',
                                    'success'
                                )
                                break;
                            default:
                                break;

                        }

                        return;

                    }
                    else {

                        Swal.fire(
                            'Warning!',
                            responseData.Message,
                            'error'
                        )

                    }

                    //if code has not been mapped
                    //if (responseData.Status == '2') {

                    //    Swal.fire(
                    //        'Warning!',
                    //        responseData.Message,
                    //        'error'
                    //    )

                    //}

                    //vendor details can not be retirved
                    //if (responseData.Status == '3') {

                    //    Swal.fire(
                    //        'Warning!',
                    //        responseData.Message,
                    //        'warning'
                    //    )

                    //}

                    //vendor details can not be retirved
                    //if (responseData.Status == '4') {

                    //    Swal.fire(
                    //        'Warning!',
                    //         responseData.Message,
                    //        'error'
                    //    )

                    //}

                    //customer has not been credited before
                    //if (responseData.Status == '5') {

                    //    Swal.fire(
                    //        'Warning!',
                    //        responseData.Message,
                    //        'error'
                    //    )

                    //}

                    //customer has not been credited before
                    //if (responseData.Status == '6') {

                    //    Swal.fire(
                    //        'Warning!',
                    //        'Hi ' + sessionStorage.getItem('email') + 'your assigned product point has not been defined... Contact The Organizer',
                    //        'warning'
                    //    )

                    //}

                    //if code does not exists
                    //if (responseData.Status == '0') {

                    //    Swal.fire(
                    //        'Error!',
                    //        'The customer QR code does not exists... Contact The Organizer',
                    //        'error'
                    //    )
                    //    return;
                    //}

                    //if others
                    //if (responseData.Status == '-1') {

                    //    Swal.fire(
                    //        'Error!',
                    //        responseData.Message,
                    //        'error'
                    //    )
                    //    return;
                    //}

                },
                beforeSend: function () {

                    Swal.fire(
                        'Please wait',
                        'Computing customer transaction..',
                        'info'
                    )

                },
                error: function (data) {
                    $("#btnTopUpWalet").html("Error occured while submiting form");
                }
            });
        }

        function GetMappedItemByVendor() {

            var vendorId = JSON.parse(sessionStorage.getItem('user'));

            var data = {
                id: vendorId.user_id
            }

            $.ajax({
                type: "POST",
                url: "/Services/items.asmx/GetMappedItemByVendor",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    // must be an array of data
                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    //console.log(responseData);
                    if (responseData.length > 0) {

                        $("#lblErrorText").html(responseData.Message);

                        console.log(responseData.event_name);

                        //if code is valid and mapped
                        if (responseData.Status == '1') {

                            $('#cmbVendorItems').empty();
                            $('#cmbVendorItems').append($("<option></option>").val(0).html("-- Please choose a mapped item --"));
                            $.each(responseData, function (i, data) {

                                $('#cmbVendorItems').append($("<option></option>").val(data.id).html(data.item_name));

                            });

                            $('#staticBackdrop').show();

                            return;

                        }
                        else {

                            Swal.fire(
                                'Warning!',
                                responseData.Message,
                                'error'
                            )

                        }

                    }
                },
                beforeSend: function () {

                    Swal.fire(
                        'Please wait',
                        'Retrieving mapped product items..',
                        'info'
                    )

                },
                error: function (data) {
                    $("#btnTopUpWalet").html("Error occured while submiting form");
                }
            });

        }

        $(document).ready(function () {

            //isRequestAuthenticated();

            $('#divAlert').hide();

            var qrCodeText = new URLSearchParams(window.location.search).get('code');
            if (qrCodeText == null || qrCodeText == undefined) {

                Swal.fire(
                    'Undefine QR Code!',
                    'The customer code is not valid or can not be found, rescan again !!!',
                    'error'
                )

            }
            else if (qrCodeText != null || qrCodeText != undefined) {

                var email = sessionStorage.getItem('email');

                //make an ajax call to get all product items mapped to the logged-in
                //vendor.
                GetMappedItemByVendor();


                //Call this method whe user clicks the make sales and checkout button
                //within the model box
                //MakeSales(qrCodeText, sessionStorage.getItem('email'));
            }
            else {

                Swal.fire({
                    title: 'Undefined QR Code!',
                    text: 'Can not find a valid QR code in the request',
                    icon: 'error'
                })
            }
        });
    </script>
</asp:Content>
